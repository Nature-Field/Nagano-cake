class ShippingAddress < ApplicationRecord
  
  belongs_to :customer
  
  validate   :customer_id, presence: true
  validate   :name, presence: true
  validate   :postal_code, presence: ture, numericality: {only_integer: true}, length: {is: 7}
  validate   :address, presence: true
  
end

