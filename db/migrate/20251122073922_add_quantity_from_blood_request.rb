class AddQuantityFromBloodRequest < ActiveRecord::Migration[7.1]
  def change
    add_column :blood_requests, :quantity, :integer, using: 'quantity::integer'
  end
end
