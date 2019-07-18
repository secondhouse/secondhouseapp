class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :request_id
      t.integer :user_id
      t.integer :entry_id

      t.timestamps
    end
  end
end
