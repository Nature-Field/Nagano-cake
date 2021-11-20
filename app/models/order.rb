class Order < ApplicationRecord

  has_many   :order_details, dependent: :destroy
  belongs_to :customer
  has_many :shipping_addresses, through: :customers


  validates :customer_id, presence: true
  validates :postal_code, presence: true, numericality: {only_integer: true}, length: {is: 7}
  validates :address, presence: true
  validates :name, presence: true
  validates :cost, presence: true
  validates :total_price, presence: true
  validates :payment_way, presence: true
  validates :status, presence: true

  enum payment_way: {credit_card: 0, transfer: 1}
  attr_accessor :address_number
  attr_accessor :registered

  def full_name
    customer.last_name + " " + customer.first_name
  end
end
