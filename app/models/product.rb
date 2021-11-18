class Product < ApplicationRecord

  belongs_to :genre, optional: true
  has_many   :cart_products
  has_many   :order_details

  validates :genre_id, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true

  attachment :image

end
