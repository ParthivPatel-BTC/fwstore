class UsersController < ApplicationController
  before_filter :user_logged_in?, only: [:delete, :sign_out]

  def new
  end

  def create
    if request.post?
      @user = Shoppe::User.new(safe_params)
      if @user.save
        session[:current_user] = @user.id
        subscribe_to_mailchimp
        redirect_to return_point || root_path, :flash => {:notice => t('shoppe.users.create_notice') }
      else
        render :action => "new"
      end
    else
      @user = Shoppe::User.new
    end
  end

  def sign_in
    if user = Shoppe::User.authenticate(params[:email_address], params[:password])
      session[:current_user] = user.id
      redirect_to return_point || root_path
    else
      flash.now[:alert] =  t('shoppe.sessions.create_alert')
      render :action => "new"
    end
  end

  def sign_out
    session[:current_user] = nil
    redirect_to :back
  end

  def delete
    raise Shoppe::Error, t('shoppe.users.self_remove_error') if @user == current_user
    @user.destroy
    redirect_to :users, :flash => {:notice => t('shoppe.users.destroy_notice') }
  end

  private
  def safe_params
    params[:user].permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
  end

  def subscribe_to_mailchimp
    begin
      subscription_detail = @mailchimp.lists.subscribe('78ceb1aa8b', "email"=> safe_params['email_address'])
    rescue Mailchimp::ListAlreadySubscribedError

    rescue Mailchimp::ListDoesNotExistError, Mailchimp::Error => ex
      flash[:error] = "The list could not be found"
    end
    begin
      @subscribe = @mailchimp.lists.batch_subscribe('78ceb1aa8b',
                                                  [{ "EMAIL" => subscription_detail,
                                                     :EMAIL_TYPE => 'html',
                                                     :merge_vars => { "FIRSTNAME" => safe_params['first_name'],
                                                                      "LASTNAME" => safe_params['last_name'],
                                                                      "STATUS" => "Subscribed",
                                                                      "LBOOKCNTRY" => "United States"}}],
                                                  false, true, false)
      flash[:notice] = 'Subscribed Successfuly'
    rescue Mailchimp::Error => ex
      flash[:error] = @subscribe['errors']
    end
  end
end
# if @subscribe['add_count'] == 1
#
# else