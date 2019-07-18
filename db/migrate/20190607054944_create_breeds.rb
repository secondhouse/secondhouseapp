class CreateBreeds < ActiveRecord::Migration[5.2]
  def change
    create_table :breeds do |t|
      t.integer :request_id
      t.string :breed1
      t.string :breed2
      t.string :breed3
      t.datetime :waiting
      t.datetime :end

      t.timestamps
    end
  end
end
