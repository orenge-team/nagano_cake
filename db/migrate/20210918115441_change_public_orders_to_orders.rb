class ChangePublicOrdersToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :public_orders, :orders
  end
end
