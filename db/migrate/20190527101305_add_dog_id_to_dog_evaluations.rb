class AddDogIdToDogEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :dog_evaluations, :dog_id, :integer
  end
end
