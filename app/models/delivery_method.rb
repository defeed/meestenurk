class DeliveryMethod < ActiveRecord::Base
  attr_accessible :name
  has_many :orders
end
