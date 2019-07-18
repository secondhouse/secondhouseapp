class AddDogId1ToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :dog_id1, :integer
  end
end
