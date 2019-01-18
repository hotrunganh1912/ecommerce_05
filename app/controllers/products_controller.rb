class ProductsController < ApplicationController
  def index
    @search = Product.search params[:q]
    @products = @search.result distinct: true
    @products = @products.newest.paginate page: params[:page],
      per_page: Settings.app.controller.produce.per_page
  end
end
