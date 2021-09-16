class Public::Order < ApplicationRecord
  belongs_to :public_customers, dependent: :destroy
  
  enum payment_method:{"クレジットカード": 0, "銀行振込": 1}
end
