class AddSenderIdToBell < ActiveRecord::Migration[5.2]
  def change
    add_column :bells, :sender_id, :integer
  end
end
