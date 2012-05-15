class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  username_regex = /^[\w]+$/i
  
  validates :name,
    :presence   => true,
    :length     => { :within => 3..15 },
    :format     => { :with => username_regex },
    :uniqueness => { :case_sensitive => false }
    
  has_secure_password
end
