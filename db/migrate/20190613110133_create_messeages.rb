class CreateMesseages < ActiveRecord::Migration[5.2]
  def change
    create_table :messeages do |t|
      t.integer :send_id
      t.integer :post_id
      t.text :messe
      t.integer :rewuest_id
      t.integer :read

      t.timestamps
    end
  end
end
