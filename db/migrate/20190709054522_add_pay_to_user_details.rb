class AddPayToUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :pay, :integer
  end
end
