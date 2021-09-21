class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :cart_item
  has_many :Order_items , dependent: :destroy

  enum payment_method:{"クレジットカード": 0, "銀行振込": 1}
end
