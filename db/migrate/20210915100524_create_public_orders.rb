class CreatePublicOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :public_orders do |t|
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false
      t.integer :total_price, null: false
      t.integer :delivery_fee, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.datetime :created_at, null: false
      t.datetime :created_at, null: false


      t.timestamps
    end
  end
end
