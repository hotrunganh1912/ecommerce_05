class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      if Order.find_by(users_id: current_user.id, status: "opend").present?
        check_order_open
      else
        update_iduser_order
      end
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render :new
    end
  end

  def destroy
    check_order
    log_out if logged_in?
    redirect_to root_url
  end
  private

  def update_iduser_order
    if session[:order_id].present?
      current_order.update_attributes(users_id: current_user.id)
    end
  end

  def check_order_open
    order = Order.find_by(users_id: current_user.id, status: "opend")
    session[:order_id] = order.id
  end
end
