class AddAlreadyToRequestDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :request_details, :already, :integer
  end
end
