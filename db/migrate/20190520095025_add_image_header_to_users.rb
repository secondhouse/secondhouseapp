class AddImageHeaderToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :image_header, :string
  end
end
