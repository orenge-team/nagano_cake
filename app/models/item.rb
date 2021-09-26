class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  attachment :image

  validates :name, presence: true
  validates :price, presence: true
  validates :genre_id, presence: true




  enum is_active: { "販売休止中": false , "販売中": true }

  def add_tax_price
    (self.price.to_i * 1.10).round
  end

   def self.looks(search, word)
    if search == "perfect_match"
      @item = Item.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @item = Item.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @item = Item.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @item = Item.where("name LIKE?","%#{word}%")
    else
      @user = Item.all
    end
   end

end
