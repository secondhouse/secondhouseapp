class AddStatusPartnerToRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :requests, :status_partner, :integer
  end
end
