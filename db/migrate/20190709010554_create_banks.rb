class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.integer :user_id
      t.string :bank_name
      t.string :branch
      t.string :kind
      t.integer :number
      t.string :name

      t.timestamps
    end
  end
end
