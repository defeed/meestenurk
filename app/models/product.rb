class Product < ActiveRecord::Base
  attr_accessible :title, :description, :price, :brand_id, :category_id, :picture
  
  belongs_to :brand
  belongs_to :category
  
  has_many :line_items
  has_many :order_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  validates :title, :description, :presence => true
  validates :title, :uniqueness => true, :length => { :minimum => 5 }
  validates :price, :numericality => { greater_than_or_equal_to: 0.10 }
  validates_attachment_content_type :picture,
                                    :content_type => /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
                                    :message => "may be only JPG, PNG or GIF. No picture will work as well."
  
  has_attached_file :picture,
                    :styles => {
                      :small  => "255x180",
                      :medium => "360x250",
                      :large  => "500x500" },
                    :default_url => "/assets/missing_:style.png"
  
  private
  
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, "Line Items present")
      return false
    end
  end
  
end