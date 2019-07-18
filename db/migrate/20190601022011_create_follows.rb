class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :receive
      t.integer :valule

      t.timestamps
    end
  end
end
