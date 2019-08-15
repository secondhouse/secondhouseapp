class ChangeDataPhoneUserDetail < ActiveRecord::Migration[5.2]
  def change
      change_column :User_details, :phone, :varchar
  end
end
