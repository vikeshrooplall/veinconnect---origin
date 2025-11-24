class RenameDonorProfilesToDonors < ActiveRecord::Migration[7.1]
  def change
    rename_table :donor_profiles, :donors
  end
end
