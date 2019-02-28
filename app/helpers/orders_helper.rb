module OrdersHelper
  def class_table product
    return :warning if product.close?
    return :info if product.pending?
    return :success if product.completed?
  end
end
