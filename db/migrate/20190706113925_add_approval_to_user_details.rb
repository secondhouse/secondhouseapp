class AddApprovalToUserDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :approval, :integer
  end
end
