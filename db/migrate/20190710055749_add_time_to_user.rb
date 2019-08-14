class AddTimeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :time, :datetime
  end
end
