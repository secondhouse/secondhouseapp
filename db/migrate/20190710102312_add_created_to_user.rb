class AddCreatedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :created, :integer
  end
end
