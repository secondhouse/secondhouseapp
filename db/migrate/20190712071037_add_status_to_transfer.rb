class AddStatusToTransfer < ActiveRecord::Migration[5.2]
  def change
    add_column :transfers, :status, :integer
  end
end
