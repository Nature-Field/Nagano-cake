class Order < ApplicationRecord
  
  has_many   :order_details
  belongs_to :customer
  
  validates :customer_id, presence: true
  validates :postal_code, presence: true, numericality: {only_integer: true}, length: {is: 7}
  validates :address, presence: true
  validates :name, presence: true
  validates :cost, presence: true
  validates :total_price, presence: true
  validates :payment_way, presence: true
  validates :order_status, presence: true
  
end
