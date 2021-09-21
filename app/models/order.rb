class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :cart_item

  enum payment_method:{"クレジットカード": 0, "銀行振込": 1}
end
