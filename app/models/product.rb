class Product < ApplicationRecord
  
  belongs_to :genre
  has_many   :cart_products
  has_many   :order_detail
  
  validate :genre_id, presence: true
  validate :is_active, inclusion: { in: [true, false] }
  validate :name, presence: true
  validate :explanation, presence: true
  validate :price, presence: true
  image_id, presence: true
  
  attachment :image_id
  
end
