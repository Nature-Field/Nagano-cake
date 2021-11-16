class CartProduct < ApplicationRecord
  
  belongs_to :customer
  belongs_to :product
  
  validates :quantitiy, presence: true 
  validates :product_id, presence: true
  validates :customer_id, presence: true
end
