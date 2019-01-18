class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: 0}
  before_save :finalize
  def price_order_detail
    product.price_out * quantity
  end

  private

  def finalize
    self[:price] = price_order_detail
  end
end
