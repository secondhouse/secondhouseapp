class CreateRequestDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :request_details do |t|
      t.integer :request_id
      t.integer :amount

      t.timestamps
    end
  end
end
