class BloodRequest < ApplicationRecord
  belongs_to :user
  belongs_to :facility

  enum blood_type: { 'A-': 0, 'A+': 1, 'AB-': 2, 'AB+': 3, 'B-': 4, 'B+': 5, 'O-': 6, 'O+': 7 }
  enum status: { pending: 0, completed: 1 }
end
