class CreatePublicOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :public_orders do |t|
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :total_price
      t.integer :delivery_fee
      t.integer :status
      t.datetime :created_at
      t.datetime :created_at


      t.timestamps
    end
  end
end
