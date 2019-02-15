class Order < ApplicationRecord
  has_many :order_details
  has_many :products, through: :order_details
  enum status: {open: 0, pending: 1, close: 2, completed: 3}
  before_save :update_total_price

  scope :status_open, -> {where status: "open"}
  scope :order_crrent_user, ->users_id{where users_id:"#{users_id}"}
  def total_price
    order_details.map{|od| (od.quantity * get_price(od.product_id))}.sum
  end

  private

  def update_total_price
    self[:total_price] = total_price
  end

  def get_price product_id
    products = Product.find_by(id: product_id)
    products.price_out
  end
end
