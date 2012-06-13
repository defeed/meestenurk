class Category < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :products
  validates :name, :description, :presence => true
  translates :name, :description
end
