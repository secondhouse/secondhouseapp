class CreateToken2s < ActiveRecord::Migration[5.2]
  def change
    create_table :token2s do |t|
      t.integer :user_id
      t.string :uuid
      t.datetime :expired_at

      t.timestamps
    end
  end
end
