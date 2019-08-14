class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.datetime :waiting
      t.datetime :end
      #t.integer :dog_choice
      t.string :adress
      t.string :walk
      t.string :walk_time
      t.string :bait
      t.string :snack
      t.string :toilet
      t.string :comment_ok
      t.string :caretaker
      t.string :child
      t.string :native
      t.string :animal
      t.string :comment_ng

      t.timestamps
    end
  end
end
