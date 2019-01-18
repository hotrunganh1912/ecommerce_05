class OrderDetailsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_order_detail, only: [:update, :destroy]
  def create
    @order = current_order
    if check_stock?
      flash[:success] = "out in stock"
    elsif @order.order_details.find_by(order_item_params_up).nil?
      new_order
    else
      add_quantiy
    end
    redirect_back fallback_location: root_path
  end

  def update
    @order_detail.update_attributes(order_item_params)
    @order.save
    @order_details = @order.order_details
    flash[:success] = t ".update"
    redirect_back fallback_location: root_path
  end

  def destroy
    @order_detail.destroy
    @order.save
    @order_details = @order.order_details
    flash[:success] = t ".destroy"
    redirect_back fallback_location: root_path
  end

  private

  def load_order_detail
    @order = current_order
    @order_detail = @order.order_details.find(params[:id])
  end

  def order_item_params
    params.require(:order_detail).permit(:quantity, :product_id)
  end

  def order_item_params_up
    params.require(:order_detail).permit(:product_id)
  end

  def new_order
    @order_detail = @order.order_details.new(order_item_params)
    @order.save
    flash[:success] = t ".create"
    session[:order_id] = @order.id
  end

  def add_quantiy
    @order_detail = @order.order_details.find_by(order_item_params_up)
    @order_detail.update_attributes(quantity: @order_detail.quantity + 1)
    flash[:success] = t ".create"
    @order.save
  end

  def get_name_product product_id
    products = Product.find_by(id: product_id)
    products.name
  end

  def check_stock?
    product= Product.find_by(id: params[:order_detail][:product_id])
    product.out_of_stock?
  end
end
