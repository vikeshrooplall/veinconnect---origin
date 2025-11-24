class AddUrgencyToBloodRequests < ActiveRecord::Migration[7.1]
  def change
    add_column :blood_requests, :urgency, :integer
  end
end
