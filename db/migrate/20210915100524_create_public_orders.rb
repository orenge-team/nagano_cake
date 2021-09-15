class CreatePublicOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :public_orders do |t|

      t.timestamps
    end
  end
end
