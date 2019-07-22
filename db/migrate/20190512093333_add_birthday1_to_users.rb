class AddBirthday1ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthday1, :string
  end
end
