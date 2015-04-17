class OrdersController < ApplicationController
  before_filter :user_logged_in?, only: [:checkout, :payment, :confirmation, :destory ]

  def destroy
    current_order.destroy
    session[:order_id] = nil
    redirect_to root_path, :notice => "Basket emptied successfully."
  end

  def checkout
    @order = Shoppe::Order.find(current_order.id)
    if request.patch?
      if @order.proceed_to_confirm(params[:order].permit(:first_name, :last_name, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number).merge(user_id: session['current_user'] ))
        redirect_to checkout_payment_path
      end
    end
  end

  def payment
    #temporary code to test mail service.
    current_order.confirm!
    session[:order_id] = nil
    redirect_to root_path, :notice => "Order has been placed successfully!"
  end

  def confirmation
    if request.post?
      current_order.confirm!
      session[:order_id] = nil
      redirect_to root_path, :notice => "Order has been placed successfully!"
    end
  end
end
