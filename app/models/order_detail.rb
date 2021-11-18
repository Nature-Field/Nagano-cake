class OrderDetail < ApplicationRecord

  belongs_to :product
  belongs_to :order

  validates :product_id, presence: true
  validates :oreder_id, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :create_status, presence: true


end
