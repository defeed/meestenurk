class Order < ActiveRecord::Base
  attr_accessible :address, :cart_id, :city, :comment, :email, :first_name, :last_name, :payment_method, :phone, :shipping_method, :status, :zip
  
  belongs_to :cart
  
  validates :address, :city, :email, :first_name, :last_name, :payment_method, :phone, :shipping_method, :zip, :presence => true
end
