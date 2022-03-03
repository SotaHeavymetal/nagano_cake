class Item < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :tables
end