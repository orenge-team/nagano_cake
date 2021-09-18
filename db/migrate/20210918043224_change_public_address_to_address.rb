class ChangePublicAddressToAddress < ActiveRecord::Migration[5.2]
  def change
     rename_table :public_addresses, :addresses
  end
end
