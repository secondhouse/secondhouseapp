class AddRequestIdToBell < ActiveRecord::Migration[5.2]
  def change
    add_column :bells, :request_id, :integer
  end
end
