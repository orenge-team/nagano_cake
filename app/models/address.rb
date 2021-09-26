class Address < ApplicationRecord
  belongs_to :customer
  def select_address
    "〒" + postal_code.to_s + " " + address.to_s + " " + name.to_s

  end
end