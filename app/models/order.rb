class Order < ActiveRecord::Base
  attr_accessible :address, :cart_id, :city, :comment, :email, :first_name, :last_name, :payment_method_id, :phone, :delivery_method_id, :status, :zip
  
  belongs_to :cart
  belongs_to :payment_method
  belongs_to :delivery_method
  
  validates :address, :city, :email, :first_name, :last_name, :payment_method_id, :phone, :delivery_method_id, :zip, :presence => true
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
  def full_address
    "#{city}, #{address}, #{zip}"
  end
end
