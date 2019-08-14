class CreateInformation < ActiveRecord::Migration[5.2]
  def change
    create_table :information do |t|
      t.string :user_id
      t.string :dog_id
      t.string :introduction

      t.timestamps
    end
  end
end
