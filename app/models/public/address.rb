class Public::Address < ApplicationRecord
  belongs_to :public_customers, dependent: :destroy
end
