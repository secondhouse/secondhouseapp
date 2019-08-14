class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.integer :user_id
      t.integer :phone
      t.string :name_last
      t.string :name_first
      t.string :name_last_reading
      t.string :name_first_reading
      t.string :address

      t.timestamps
    end
  end
end
