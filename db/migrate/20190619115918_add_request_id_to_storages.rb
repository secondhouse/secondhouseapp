class AddRequestIdToStorages < ActiveRecord::Migration[5.2]
  def change
    add_column :storages, :request_id, :integer
  end
end
