class AddAddressColumntoListingsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :listings, :address, :string
  end
end
