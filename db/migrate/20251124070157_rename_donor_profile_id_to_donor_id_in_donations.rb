class RenameDonorProfileIdToDonorIdInDonations < ActiveRecord::Migration[7.1]
  def change
    rename_column :donations, :donor_profile_id, :donor_id
  end
end
