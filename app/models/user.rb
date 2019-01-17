class User < ApplicationRecord
  has_many :ratings
  has_many :orders
  enum role: {member: 0, admin: 1}
end
