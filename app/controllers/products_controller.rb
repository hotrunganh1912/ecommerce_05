class ProductsController < ApplicationController
  def index
    @products = Product.newest
    @search = Product.search params[:q]
    @products = @search.result :distinct => true
    @products = @products.paginate page: params[:page],
      per_page: Settings.app.controller.produce.per_page
    @order_details = current_order.order_details.new
  end
end
