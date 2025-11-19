class AddIsDonorToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :is_donor, :boolean
  end
end
