class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  attachment :image

  enum is_active: { "販売休止中": false , "販売中": true }

  def add_tax_price
    (self.price * 1.10).round
  end

 
end
