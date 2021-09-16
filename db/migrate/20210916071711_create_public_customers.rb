class CreatePublicCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :public_customers do |t|

      t.timestamps
    end
  end
end
