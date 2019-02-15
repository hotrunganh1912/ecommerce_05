class OrderDetailsController < ApplicationController
  before_action :load_order_detail, only: [:update, :destroy]
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
    @order_detail.update_attributes(order_item_params)
    @order.save
    flash[:success] = "Successfully update ' #{get_name_product params[:order_detail][:product_id]} ' to the cart "
    @order_details = @order.order_details
    redirect_back fallback_location: root_path
  end

  def destroy
    @order_detail.destroy
    @order.save
    flash[:success] = "Successfully delete to the cart "
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
    flash[:success] = "Successfully add  #{get_name_product params[:order_detail][:product_id]}  to the cart "
  end

  def add_quantiy
    @order_detail = @order.order_details.find_by(order_item_params_up)
    @order_detail.update_attributes(quantity: @order_detail.quantity + 1)
    @order.save
    flash[:success] = "Successfully add one  #{get_name_product params[:order_detail][:product_id]} to the cart "
  end

  def get_name_product product_id
    products = Product.find_by(id: product_id)
    products.name
  end

  def load_order_detail
    @order = current_order
    @order_detail = @order.order_details.find_by(id: params[:id])
  end
end
