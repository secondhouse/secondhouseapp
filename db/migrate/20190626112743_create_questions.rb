class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.text :content
      t.string :kind
      t.string :emai

      t.timestamps
    end
  end
end
