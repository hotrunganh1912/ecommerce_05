class OrdersController < ApplicationController
  before_action :load_order_current, only: %i(update show)
  def update
    @order.update_attributes(order_parmas)
    @order.save
    flash[:success] = "Successfully order "
    session.delete(:order_id)
    redirect_to root_path
  end

  private

  def load_order_current
    @order = Order.find_by(id: current_order.id)
  end


  def order_parmas
    params.require(:order).permit(:status)
  end
end
