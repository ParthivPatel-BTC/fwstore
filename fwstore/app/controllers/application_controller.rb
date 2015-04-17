class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :mailchimp

  private
    def user_logged_in?(return_point = request.url)
      unless session[:current_user].present?
        session['return_url'] = return_point
        redirect_to users_new_path
      end
    end

    def return_point
      session['return_url'] || root_url
    end

    def mailchimp
      @mailchimp = Mailchimp::API.new('138266e8a9415529e7d4c0dd079aedca-us10')
    end

    def current_user
      session[:current_user].present? ? true : false
    end

    def current_order
      @current_order ||= begin
        if has_order?
          @current_order
        else
          order = Shoppe::Order.create(:ip_address => request.ip)
          session[:order_id] = order.id
          order
        end
      end
    end

    def has_order?
      !!(
        session[:order_id] &&
        @current_order = Shoppe::Order.includes(:order_items => :ordered_item).find_by_id(session[:order_id])
      )
    end
  
    helper_method :current_order, :has_order?, :current_user
  
end
