class Product < ApplicationRecord
  has_many :ratings
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :images
  belongs_to :category
  enum status: {in_stock: 0, out_of_stock: 1}

  scope :newest, ->{order created_at: :DESC}
  scope :product_name, ->(srch){where "name like ?", "#{srch.strip}%"}
end
