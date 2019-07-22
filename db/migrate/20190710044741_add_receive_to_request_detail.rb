class AddReceiveToRequestDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :request_details, :recieve, :integer
  end
end
