class Address < ApplicationRecord
  belongs_to :customer, dependent: :destroy
end