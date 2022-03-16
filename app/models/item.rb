class Item < ApplicationRecord
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  attachment :image
  has_many :cart_items, dependent: :destroy
  has_many :tables
  has_many :order_details
  belongs_to :genre

  def self.search(keyword)
  where(["name like?", "%#{keyword}%"])
  end

  def with_tax_price
    (price * 1.1).floor
  end
end