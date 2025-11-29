class AddAcceptedByToBloodRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :blood_requests, :accepted_by_id, :bigint
    add_foreign_key :blood_requests, :users, column: :accepted_by_id
    add_index :blood_requests, :accepted_by_id
  end
end
