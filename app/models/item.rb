class Item < ApplicationRecord
 
  belongs_to :genre
  attachment :image
  # enum is_active:{"販売中", "販売中止中"}
  
end
