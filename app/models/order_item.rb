class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order
  enum making_status: {"着手不可": 0, "制作待ち": 1,"製作中": 2,"制作完了": 3}

  def sum_price
    item.add_tax_price * count
  end

  def add_tax_price
    (self.price * 1.10).round
  end


end
