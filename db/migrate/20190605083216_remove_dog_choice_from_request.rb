class RemoveDogChoiceFromRequest < ActiveRecord::Migration[5.2]
  def change
    remove_column :requests, :dog_choice, :string
  end
end
