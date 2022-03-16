class Order < ApplicationRecord
  belongs_to :customer
  has_many :orders_details, dependent: :destroy
  enum payment: [:クレジットカード, :銀行振込]
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum asdf: [:ご自身の住所, :登録済住所から選択, :新しいお届け先]
  enum select_address: { my_address: 0, registered_address: 1, new_address: 2 }
  enum qwer: [:入金待ち, :入金確認中, :製作中, :発送準備中, :発送済み]
  enum order_status: {}
  validates :total_payment, presence: true
  validates :shipping_cost, presence: true
  def sum_amount
    sum = 0
    self.orders_details.each do |detail|
      sum += detail.amount
    end
    return sum
  end
end
