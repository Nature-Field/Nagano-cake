class Product < ApplicationRecord
  
  belongs_to :genre
  has_many   :cart_products
  has_many   :order_details
  
  validates :genre_id, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image_id, presence: true
  
  attachment :image_id
  
end
