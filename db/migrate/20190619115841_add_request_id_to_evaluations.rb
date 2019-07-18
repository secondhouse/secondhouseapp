class AddRequestIdToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :evaluations, :request_id, :integer
  end
end
