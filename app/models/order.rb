class Order < ApplicationRecord
  has_many :orders_detail
  belongs_to :user
  enum status: {open: 0, pending: 1, close: 2}
end
