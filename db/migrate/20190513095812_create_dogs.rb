class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :image_name
      t.string :sex
      t.string :birthday
      t.string :dog_breed
      t.string :weight
      t.string :castration
      t.string :rabies
      t.string :character

      t.timestamps
    end
  end
end
