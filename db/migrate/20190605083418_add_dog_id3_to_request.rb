class AddDogId3ToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :dog_id3, :integer
  end
end
