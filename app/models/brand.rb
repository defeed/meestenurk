class Brand < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :products
  validates :name, :description, :presence => true
end
