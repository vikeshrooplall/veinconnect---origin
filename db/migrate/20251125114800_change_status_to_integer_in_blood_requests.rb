class ChangeStatusToIntegerInBloodRequests < ActiveRecord::Migration[7.1]
  def change
    remove_column :blood_requests, :status, :string

    add_column :blood_requests, :status, :integer, default: 0, null: false
  end
end
