class AddChoiceToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :choice, :integer
  end
end
