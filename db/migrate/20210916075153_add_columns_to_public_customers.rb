class AddColumnsToPublicCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :public_customers, :first_name, :string
    add_column :public_customers, :last_name, :string
    add_column :public_customers, :first_name_kana, :string
    add_column :public_customers, :last_name_kana, :string
    add_column :public_customers, :email, :string
    add_column :public_customers, :postal_code, :string
    add_column :public_customers, :adress, :string
    add_column :public_customers, :phone_number, :string
    add_column :public_customers, :is_deleted, :boolean, default: true, null: false
  end
end
