class AddAddressToBreeds < ActiveRecord::Migration[5.2]
  def change
    add_column :breeds, :address, :string
  end
end
