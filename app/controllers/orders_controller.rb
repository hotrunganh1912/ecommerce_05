class OrdersController < ApplicationController
  before_action :load_order_current, only: %i(update show)
  before_action :laod_order, only: %i(destroy)
  def index
    @orders = Order.all
  end

  def show
  end

  def update
    @order.update_attributes(order_parmas)
    @order.save
    flash[:success] = "Successfully order "
    session.delete(:order_id)
    redirect_to root_path
  end

  def destroy
    @order.destroy if logged_in?
    flash[:success] = "Successfully destroy order "
    redirect_to history_path
  end

  private

  def load_order_current
    @order = Order.find_by(id: current_order.id)
  end

  def laod_order
    @order = Order.find_by(id: params[:id])
  end

  def order_parmas
    params.require(:order).permit(:status)
  end
end
