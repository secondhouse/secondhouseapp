class AddIdImage2ToUserDetail < ActiveRecord::Migration[5.2]
  def change
    add_column :user_details, :id_image2, :string
  end
end
