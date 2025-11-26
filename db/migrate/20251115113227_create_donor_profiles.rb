class CreateDonorProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :donor_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :donor_status, default: true
      t.boolean :eligibility_status, default: true
      t.date :last_donation_date

      t.timestamps
    end
  end
end
