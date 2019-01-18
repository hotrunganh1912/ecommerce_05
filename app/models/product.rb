class Product < ApplicationRecord
  has_many :ratings
  has_many :order_details
  has_many :orders, through: :order_details
  has_many :images
  belongs_to :category
  enum status: {"in stock": 0, "out of stock": 1}

  scope :product_name, ->(srch){where "name like ?", "#{srch.strip}%"}
end
