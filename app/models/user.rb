class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  BLOOD_TYPES = %w[A- A+ B- B+ AB- AB+ O- O+].freeze

  # Associations
  has_one :donor, dependent: :destroy
  accepts_nested_attributes_for :donor
  has_many :blood_requests, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id', dependent: :destroy
  has_many :received_messages, class_name: 'Message', foreign_key: 'recipient_id', dependent: :destroy
  has_many :notifications, dependent: :destroy

  # Validations
  validates :first_name, :last_name, :date_of_birth, :email, :phone, presence: true
  validates :blood_type, presence: true
  validates :email, uniqueness: true
  validate :age_must_be_at_least_18

  def donor?
    is_donor
  end

  def full_name
    "#{first_name} #{last_name}"
  end
  # Custom validation method
  def age_must_be_at_least_18
    return if date_of_birth.blank?  # Skip if no DOB

    if date_of_birth > 18.years.ago.to_date
      errors.add(:date_of_birth, "You must be at least 18 years old")
    end
  end
end
