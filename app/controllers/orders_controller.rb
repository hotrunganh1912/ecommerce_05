class OrdersController < ApplicationController
  before_action :load_order_current, only: %i(update show)
  def update
    @order.update_attributes(order_parmas)
    @order.save
    flash[:success] = "Successfully order "
    session.delete(:order_id)
    redirect_back fallback_location: root_path
  end

  def index
    @search = Order.ransack params[:q]
    @orders = @search.result
    Order.select(:parent_id).joins(:category_coaches)
  end

  def show
    orders = Order.find_by(id: params[:id])
    @order_details = orders.order_details
  end

  private

  def load_order_current
    @order = Order.find_by(id: params[:id])
  end


  def order_parmas
    params.require(:order).permit(:status)
  end
end
