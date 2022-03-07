class Order < ApplicationRecord
  belongs_to :customer
  enum payment: [:クレジットカード, :銀行振込]
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum address: [:ご自身の住所, :登録済住所から選択, :新しいお届け先]
  enum select_address: { my_address: 0, registered_address: 1, new_address: 2 }
end
