class RemoveLoginFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :Login, :datetime
  end
end
