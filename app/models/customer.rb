class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  enum is_deleted: { "有効": false , "退会": true }

  has_many :orders, dependent: :destroy

  has_many :addresses, dependent: :destroy

  has_many :cart_items, dependent: :destroy


  def full_name
    self.first_name + " " + self.last_name
  end



end
