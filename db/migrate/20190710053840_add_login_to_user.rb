class AddLoginToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :Login, :datetime
  end
end
