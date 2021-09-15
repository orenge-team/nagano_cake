class Public::Order < ApplicationRecord
  has_many :public_customers, dependent: :destroy
end
