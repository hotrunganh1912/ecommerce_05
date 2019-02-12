class ProductsController < ApplicationController
  def index
    @products = Product.newest
    @products = @products.paginate page: params[:page],
      per_page: Settings.app.controller.produce.per_page
  end
end
