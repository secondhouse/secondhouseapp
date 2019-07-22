class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :partner
      t.integer :request

      t.timestamps
    end
  end
end
