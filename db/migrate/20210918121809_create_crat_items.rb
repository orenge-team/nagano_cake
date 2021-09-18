class CreateCratItems < ActiveRecord::Migration[5.2]
  def change
    create_table :crat_items do |t|
      t.integer :item_id
      t.integer :customer_id
      t.integer :count

      t.timestamps
    end
  end
end
