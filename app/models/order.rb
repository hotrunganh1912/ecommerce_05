class Order < ApplicationRecord
  has_many :order_details
  has_many :products, through: :order_details
  enum status: {open: 0, pending: 1, close: 2, completed: 3}
  before_save :update_total_price

  def total_price
    order_details.map{|od| (od.quantity * get_price(od.product_id))}.sum
  end

  private

  def update_total_price
    self[:total_price] = total_price
  end

  def get_price id_product
    products = Product.find_by(id: id_product)
    products.price_out
  end
end
