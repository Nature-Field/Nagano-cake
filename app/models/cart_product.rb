class CartProduct < ApplicationRecord
  validates :quantitiy, presence: true 
  validates :product_id, presence: true
  validates :customer_id, presence: true
end
