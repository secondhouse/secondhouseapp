class AddIdImage1ToUserDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :id_image1, :string
  end
end
