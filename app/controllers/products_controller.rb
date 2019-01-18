class ProductsController < ApplicationController
  def index
    @products = Product.newest
    @products = if params[:srch].present?
                  @products.product_name params[:srch]
                else
                  @products
                end.paginate page: params[:page],
                  per_page: Settings.app.controller.produce.per_page
  end
end
