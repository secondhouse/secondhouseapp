class AddReadToBells < ActiveRecord::Migration[5.2]
  def change
    add_column :bells, :read, :integer
  end
end
