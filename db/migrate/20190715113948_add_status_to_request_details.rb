class AddStatusToRequestDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :request_details, :status, :integer
  end
end
