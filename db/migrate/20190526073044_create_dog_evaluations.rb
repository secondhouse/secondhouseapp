class CreateDogEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :dog_evaluations do |t|
      t.integer :user_id
      t.integer :rater_id
      t.integer :overall
      t.string :comment
      t.integer :service_id

      t.timestamps
    end
  end
end
