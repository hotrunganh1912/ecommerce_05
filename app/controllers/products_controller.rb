class ProductsController < ApplicationController
  def index
    @products = Product.where(nil) # creates an anonymous scope
    @products = @products.product_name(params[:srch]) if params[:srch].present?
    @products = @products.paginate(page: params[:page], per_page: 9)
    @order_details = current_order.order_details.new
  end
end
