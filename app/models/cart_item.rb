class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer

  def sum_price
    item.add_tax_price * count
  end

end
