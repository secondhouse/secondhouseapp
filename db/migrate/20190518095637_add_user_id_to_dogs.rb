class AddUserIdToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :user_id, :string
  end
end
