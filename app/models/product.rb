class Product < ApplicationRecord
  has_many :ratings
  has_many :order_details
  has_many :images
  belongs_to :categorie
  enum status: {"in stock": 0, "out of stock": 1}
end
