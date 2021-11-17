class Product < ApplicationRecord

  #genre未実装のため、optional~追加：他modelがnilでもOK
  belongs_to :genre, optional: true
  has_many   :cart_products
  has_many   :order_details

  validates :genre_id, presence: true
  validates :is_active, inclusion: { in: [true, false] }
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  validates :image, presence: true

  attachment :image

end
