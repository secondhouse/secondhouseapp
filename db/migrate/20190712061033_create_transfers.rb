class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.integer :user_id
      t.integer :total
      t.integer :bank_id

      t.timestamps
    end
  end
end
