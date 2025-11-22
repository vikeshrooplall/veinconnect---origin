class RemoveQuantityFromBloodRequest < ActiveRecord::Migration[7.1]
  def change
    remove_column :blood_requests, :quantity, :string
  end
end
