class OrderDetailsController < ApplicationController
  def create
    @order = current_order
    if @order.order_details.find_by(order_item_params_up).nil?
      new_order
    else
      add_quantiy
    end
    redirect_back fallback_location: root_path
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.update_attributes(order_item_params)
    @order.save
    @order_details = @order.order_details
    redirect_back fallback_location: root_path
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
    @order_detail.destroy
    @order.save
    @order_details = @order.order_details
    redirect_back fallback_location: root_path
  end

  private

  def order_item_params
    params.require(:order_detail).permit(:quantity, :product_id)
  end

  def order_item_params_up
    params.require(:order_detail).permit(:product_id)
  end

  def new_order
    @order_detail = @order.order_details.new(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def add_quantiy
    @order_detail = @order.order_details.find_by(order_item_params_up)
    @order_detail.update_attributes(quantity: @order_detail.quantity + 1)
    @order.save
  end
end
