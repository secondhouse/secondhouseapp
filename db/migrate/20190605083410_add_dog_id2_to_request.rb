class AddDogId2ToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :dog_id2, :integer
  end
end
