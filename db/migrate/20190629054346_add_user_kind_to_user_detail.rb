class AddUserKindToUserDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :user_kind, :integer
  end
end
