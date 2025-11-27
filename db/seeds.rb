puts 'Cleaning database...'
# Destroy all previous records
Facility.destroy_all
User.destroy_all
BloodRequest.destroy_all
Donor.destroy_all
Donation.destroy_all
Notification.destroy_all

puts '🌱 Seeding facilities...'
# Seeding Facilities (25 facilities as per your list)
facilities = [
  { name: "Victoria Hospital", address: "Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "hospital" },
  { name: "Jeetoo Hospital", address: "Port Louis, Mauritius", phone_number: "2031001", facility_type: "hospital" },
  { name: "Jawaharlal Nehru Hospital", address: "Rose Belle, Mauritius", phone_number: "6037000", facility_type: "hospital" },
  { name: "RightNow Medical Hub", address: "Royal Road, Curepipe, Mauritius", phone_number: "54794843", facility_type: "clinic" },
  { name: "City Clinic", address: "Sir William Newton Street, Port Louis, Mauritius", phone_number: "2011600", facility_type: "clinic" },
  { name: "Medic World", address: "Royal Road, Quatre Bornes, Mauritius", phone_number: "4073000", facility_type: "clinic" },
  { name: "Clinique Muller", address: "Royal Road, Curepipe, Mauritius", phone_number: "6702911", facility_type: "clinic" },
  { name: "Phoenix Health Centre", address: "Vacoas, Mauritius", phone_number: "6964286", facility_type: "clinic" },
  { name: "Rose Hill Centre", address: "Royal Road, Rose Hill, Mauritius", phone_number: "4541937", facility_type: "clinic" },
  { name: "Medical Surgical Centre", address: "Floreal, Mauritius", phone_number: "6012300", facility_type: "clinic" },
  { name: "Holyrood Community Centre", address: "Holyrood Street, Vacoas, Mauritius", phone_number: "6973073", facility_type: "clinic" },
  { name: "Mahebourg Hospital", address: "Coastal Road, Mahebourg, Mauritius", phone_number: "6042000", facility_type: "hospital" },
  { name: "Lady Sushil Ramgoolam Clinic", address: "Belvedere, Mauritius", phone_number: "4181364", facility_type: "clinic" }
]

facilities.each do |facility|
  Facility.create!(facility)
end

puts '🌱 Seeding users...'
# Seeding Users (25 users)
25.times do |i|
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: "password123",
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
    phone: rand(10000000..99999999),
    address: Faker::Address.full_address,
    blood_type: ["A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-"].sample,
    is_donor: [true, false].sample
  )
end

puts '🌱 Seeding blood requests...'
# Seeding BloodRequests (25 blood requests)
25.times do
  BloodRequest.create!(
    user: User.all.sample,
    facility: Facility.all.sample,
    blood_type: ["A+", "B+", "O+", "AB+", "A-", "B-", "O-", "AB-"].sample,
    patient_name: Faker::Name.name,
    patient_phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    needed_by: Faker::Date.forward(days: 7),
    message: Faker::Lorem.sentence(word_count: 10),
    quantity: rand(1..5),
    urgency: rand(1..3),
    status: rand(0..2)  # Randomly assigning status
  )
end

puts '🌱 Seeding donors...'
# Seeding Donors (25 donors)
25.times do |i|
  Donor.create!(
    user: User.all.sample,
    donor_status: [true, false].sample,
    eligibility_status: [true, false].sample,
    last_donation_date: Faker::Date.backward(days: rand(30..365))
  )
end

# puts '🌱 Seeding donations...'
# # Seeding Donations (25 donations)
# 25.times do
#   Donation.create!(
#     donor: Donor.all.sample,
#     blood_request: BloodRequest.all.sample,
#     facility: Facility.all.sample,
#     status: ["pending", "completed", "failed"].sample  # Assigning string status directly
#   )
# end

# puts '🌱 Seeding notifications...'
# # Seeding Notifications (25 notifications)
# 25.times do
#   Notification.create!(
#     user: User.all.sample,
#     notifiable_type: "BloodRequest",
#     notifiable_id: BloodRequest.all.sample.id,
#     kind: ["Urgent Blood Request", "New Blood Request"].sample,
#     data: { message: Faker::Lorem.sentence }.to_json,
#     blood_request: BloodRequest.all.sample,
#     read_at: [nil, Time.now].sample
#   )
# end

puts "✅ Done seeding!"
