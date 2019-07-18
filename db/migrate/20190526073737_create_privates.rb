class CreatePrivates < ActiveRecord::Migration[5.2]
  def change
    create_table :privates do |t|
      t.integer :user_id
      t.integer :rater_id
      t.integer :communication
      t.integer :service
      t.integer :service_id

      t.timestamps
    end
  end
end
