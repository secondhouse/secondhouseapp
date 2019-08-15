class RemoveUserKindFromUserDetail < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_details, :use_kind, :integer
  end
end
