class Order < ApplicationRecord
  belongs_to :customer
  enum payment: [:クレジットカード, :銀行振込]
  enum payment_method: { credit_card: 0, transfer: 1 }
end
