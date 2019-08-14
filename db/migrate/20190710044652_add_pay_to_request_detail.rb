class AddPayToRequestDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :request_details, :pay, :integer
  end
end
