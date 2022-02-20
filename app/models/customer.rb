class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders, dependent: :destroy
  has_many :ship_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true

  # attachment :profile_image

  # validates :name, presence: true, length: {in:2..20}
  # validates :name, uniqueness: true
  # validates :introduction, length: {maximum: 50}
end
