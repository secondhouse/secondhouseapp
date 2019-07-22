class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :number
      t.integer :year
      t.integer :mouth
      t.string :name
      t.integer :code

      t.timestamps
    end
  end
end
