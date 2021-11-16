class CartProduct < ApplicationRecord
  validate :quantitiy, presence: true 
  validate :product_id, presence: true
  validate :customer_id, presence: true
end
