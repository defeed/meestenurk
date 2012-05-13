class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :brand_id, :category_id
  
  belongs_to :brand
  belongs_to :category
  
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true, :length => { :minimum => 5 }
  validates :price, :numericality => { greater_than_or_equal_to: 0.10 }
end
