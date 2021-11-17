class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_products, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, uniqueness: true, presence: true
  validates :phone_number, uniqueness: true, presence: true
  validates :postal_code, presence: true, numericality: {only_integer:true}, length: {is: 7}
  validates :address, presence: true
  validates :is_deleted, inclusion: {in:[true,false]}
end
