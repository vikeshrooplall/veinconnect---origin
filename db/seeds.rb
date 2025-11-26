# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Cleaning database...'
# Facility.destroy_all

puts '🌱 Seeding facilities in Mauritius...'

facilities = [
  { name: "Victoria Hospital", address: "Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "hospital" },
  { name: "Jeetoo Hospital", address: "Port Louis, Mauritius", phone_number: "2031001", facility_type: "hospital" },
  { name: "Jawaharlal Nehru Hospital", address: "Rose Belle, Mauritius", phone_number: "6037000", facility_type: "hospital" },
  { name: "C‑Care Wellkin", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "clinic" },
  { name: "C‑Care Darné", address: "Georges Guibert Street, Floréal, Mauritius", phone_number: "6012300", facility_type: "clinic" },
  { name: "C‑Care Grand Baie", address: "Chemin Vinght Pied, Grand Baie, Mauritius", phone_number: "6012500", facility_type: "clinic" },
  { name: "City Clinic", address: "Sir Edgar Laurent St, Port Louis", phone_number: "2420486", facility_type: "clinic" },
  { name: "Clinique du Nord", address: "Grand Baie, Mauritius", phone_number: "2472532", facility_type: "clinic" },
  { name: "Clinique Ferrière de Bon Secours", address: "Curepipe, Mauritius", phone_number: "6763332", facility_type: "clinic" },
  { name: "Clinique Bon Pasteur", address: "G. Pitot St, Beau Bassin‑Rose Hill", phone_number: "4019500", facility_type: "clinic" },
  { name: "MedPoint Clinic", address: "Grand Baie, Mauritius", phone_number: "4267777", facility_type: "clinic" },
  { name: "Victoria Clinic", address: "Quatre Bornes, Mauritius", phone_number: "4020800", facility_type: "clinic" },
  { name: "Sun Medical Clinic", address: "Curepipe, Mauritius", phone_number: "6061300", facility_type: "clinic" },
  { name: "Artemis Curepipe Hospital", address: "Curepipe, Mauritius", phone_number: "6515050", facility_type: "clinic" },
  { name: "Premium Care Clinic", address: "Beaux-Songes Link Road, Vacoas-Phoenix", phone_number: "4908128", facility_type: "clinic" },
  { name: "Nirvaran Clinic", address: "Quatre Bornes, Mauritius", phone_number: "55063945", facility_type: "clinic" },
  { name: "RightNow Medical Hub", address: "Curepipe, Mauritius", phone_number: "54794843", facility_type: "clinic" },
  { name: "Phoenix Community Health Centre", address: "Edgar Quirin Avenue, Vacoas-Phoenix", phone_number: "0000003", facility_type: "clinic" },
  { name: "Rose Hill Area Health Centre", address: "B 1, Beau Bassin‑Rose Hill", phone_number: "4541937", facility_type: "clinic" },
  { name: "Medical Surgical Centre Ltd", address: "Rue George Gilbert, Floréal, Curepipe", phone_number: "601 2300", facility_type: "clinic" },
  { name: "Forest‑Side Community Health Center", address: "Curepipe, Mauritius", phone_number: " 674 2647", facility_type: "clinic" },
  { name: "Holyrood Community Centre", address: "Reservoir Rd, Vacoas‑Phoenix", phone_number: "0000007", facility_type: "clinic" },
  { name: "Nirvaran Clinic", address: "Quatre Bornes", phone_number: "55063945", facility_type: "clinic" },
  { name: "C‑Care Tamarin", address: "Royal Road, La Mivoie, Tamarin, Black River, Mauritius", phone_number: "4840600", facility_type: "clinic" },
  { name: "Clinique du Nord", address: "Baie du Tombeau, Grand Baie, Mauritius", phone_number: "2472532", facility_type: "clinic" }
]

facilities.each do |facility|
  Facility.create!(facility)
end


puts '🌱 Seeding for user'
user1 = { first_name: "Aisha", last_name: "Ramdin", date_of_birth: "1993-04-12", email: "aisha.ramdin@example.com", password: "password123", phone_number: "57981234", address: "Quatre Bornes, Mauritius", created_at: Time.now, updated_at: Time.now }
user2 = { first_name: "Kevin", last_name: "Appadoo", date_of_birth: "1988-11-22", email: "kevin.appadoo@example.com", password: "password123", phone_number: "58564321", address: "Port Louis, Mauritius", created_at: Time.now, updated_at: Time.now }
user3 = { first_name: "Marie", last_name: "Duval", date_of_birth: "1990-02-03", email: "marie.duval@example.com", password: "password123", phone_number: "59210234", address: "Curepipe, Mauritius", created_at: Time.now, updated_at: Time.now }
user4 = { first_name: "Vikash", last_name: "Rughoobur", date_of_birth: "1995-07-14", email: "vikash.rughoobur@example.com", password: "password123", phone_number: "57651209", address: "Vacoas, Mauritius", created_at: Time.now, updated_at: Time.now }
user5 = { first_name: "Sarah", last_name: "Latour", date_of_birth: "1987-09-25", email: "sarah.latour@example.com", password: "password123", phone_number: "59482211", address: "Rose Hill, Mauritius", created_at: Time.now, updated_at: Time.now }
user6 = { first_name: "Jason", last_name: "Ng", date_of_birth: "1998-01-19", email: "jason.ng@example.com", password: "password123", phone_number: "58091344", address: "Beau Bassin, Mauritius", created_at: Time.now, updated_at: Time.now }
user7 = { first_name: "Priya", last_name: "Seetohul", date_of_birth: "1992-06-11", email: "priya.seetohul@example.com", password: "password123", phone_number: "57221198", address: "Flacq, Mauritius", created_at: Time.now, updated_at: Time.now }
user8 = { first_name: "Miguel", last_name: "Da Silva", date_of_birth: "1985-12-02", email: "miguel.dasilva@example.com", password: "password123", phone_number: "59734122", address: "Moka, Mauritius", created_at: Time.now, updated_at: Time.now }
user9 = { first_name: "Anjali", last_name: "Bhugaloo", date_of_birth: "1994-08-17", email: "anjali.bhugaloo@example.com", password: "password123", phone_number: "59120017", address: "Goodlands, Mauritius", created_at: Time.now, updated_at: Time.now }
user10 = { first_name: "Dylan", last_name: "Clement", date_of_birth: "1999-03-28", email: "dylan.clement@example.com", password: "password123", phone_number: "57399821", address: "Mahebourg, Mauritius", created_at: Time.now, updated_at: Time.now }
user11 = { first_name: "Stephanie", last_name: "Wong", date_of_birth: "1986-10-10", email: "stephanie.wong@example.com", password: "password123", phone_number: "59672210", address: "Port Louis, Mauritius", created_at: Time.now, updated_at: Time.now }
user12 = { first_name: "Kunal", last_name: "Gopal", date_of_birth: "1991-05-05", email: "kunal.gopal@example.com", password: "password123", phone_number: "58412390", address: "Triolet, Mauritius", created_at: Time.now, updated_at: Time.now }
user13 = { first_name: "Emma", last_name: "Ramasamy", date_of_birth: "2000-02-14", email: "emma.ramasamy@example.com", password: "password123", phone_number: "57982011", address: "Quatre Bornes, Mauritius", created_at: Time.now, updated_at: Time.now }
user14 = { first_name: "Yannick", last_name: "Legrand", date_of_birth: "1984-04-30", email: "yannick.legrand@example.com", password: "password123", phone_number: "59564401", address: "Curepipe, Mauritius", created_at: Time.now, updated_at: Time.now }
user15 = { first_name: "Lina", last_name: "Peerbux", date_of_birth: "1997-06-08", email: "lina.peerbux@example.com", password: "password123", phone_number: "57812209", address: "Vacoas, Mauritius", created_at: Time.now, updated_at: Time.now }
user16 = { first_name: "Thierry", last_name: "Labonte", date_of_birth: "1989-01-04", email: "thierry.labonte@example.com", password: "password123", phone_number: "59382177", address: "Grand Baie, Mauritius", created_at: Time.now, updated_at: Time.now }
user17 = { first_name: "Sanjana", last_name: "Mohit", date_of_birth: "1993-09-20", email: "sanjana.mohit@example.com", password: "password123", phone_number: "57720016", address: "Terre Rouge, Mauritius", created_at: Time.now, updated_at: Time.now }
user18 = { first_name: "Lucas", last_name: "Robert", date_of_birth: "1990-03-10", email: "lucas.robert@example.com", password: "password123", phone_number: "59831190", address: "Port Louis, Mauritius", created_at: Time.now, updated_at: Time.now }
user19 = { first_name: "Melissa", last_name: "d’Hotman", date_of_birth: "1996-07-01", email: "melissa.dhotman@example.com", password: "password123", phone_number: "57123098", address: "Floréal, Mauritius", created_at: Time.now, updated_at: Time.now }
user20 = { first_name: "Harish", last_name: "Bheekhun", date_of_birth: "1988-08-09", email: "harish.bheekhun@example.com", password: "password123", phone_number: "57689012", address: "Phoenix, Mauritius", created_at: Time.now, updated_at: Time.now }
user21 = { first_name: "Amira", last_name: "Rahim", date_of_birth: "1995-11-12", email: "amira.rahim@example.com", password: "password123", phone_number: "59071822", address: "Quatre Bornes, Mauritius", created_at: Time.now, updated_at: Time.now }
user22 = { first_name: "Jonathan", last_name: "Perrine", date_of_birth: "1987-02-23", email: "jonathan.perrine@example.com", password: "password123", phone_number: "58280117", address: "Curepipe, Mauritius", created_at: Time.now, updated_at: Time.now }
user23 = { first_name: "Shreya", last_name: "Oodit", date_of_birth: "1998-05-09", email: "shreya.oodit@example.com", password: "password123", phone_number: "59320178", address: "Moka, Mauritius", created_at: Time.now, updated_at: Time.now }
user24 = { first_name: "Andrew", last_name: "André", date_of_birth: "1985-10-16", email: "andrew.andre@example.com", password: "password123", phone_number: "59911032", address: "Rose Hill, Mauritius", created_at: Time.now, updated_at: Time.now }
user25 = { first_name: "Farah", last_name: "Abdool", date_of_birth: "1992-12-25", email: "farah.abdool@example.com", password: "password123", phone_number: "57192304", address: "Port Louis, Mauritius", created_at: Time.now, updated_at: Time.now }
user26 = { first_name: "Ryan", last_name: "Cheung", date_of_birth: "1991-03-29", email: "ryan.cheung@example.com", password: "password123", phone_number: "58870019", address: "Quatre Bornes, Mauritius", created_at: Time.now, updated_at: Time.now }
user27 = { first_name: "Neha", last_name: "Dowlut", date_of_birth: "1997-09-03", email: "neha.dowlut@example.com", password: "password123", phone_number: "59011098", address: "Triolet, Mauritius", created_at: Time.now, updated_at: Time.now }

puts '🌱 Seeding for blood request'
blood_request1 = { blood_request_id: 1, user_id: 1, facility_id: 3, blood_type: "A+", needed_by: "2025-12-05", status: "pending", patient_name: "Aisha Ramdin", patient_phone_number: "57981234", message: "Blood needed for surgery", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request2 = { blood_request_id: 2, user_id: 2, facility_id: 1, blood_type: "O-", needed_by: "2025-11-28", status: "completed", patient_name: "Kevin Appadoo", patient_phone_number: "58564321", message: "Accident emergency", quantity: 3, created_at: Time.now, completed_at: Time.now }
blood_request3 = { blood_request_id: 3, user_id: 3, facility_id: 4, blood_type: "B+", needed_by: "2025-12-10", status: "pending", patient_name: "Marie Duval", patient_phone_number: "59210234", message: "Scheduled surgery", quantity: 1, created_at: Time.now, completed_at: nil }
blood_request4 = { blood_request_id: 4, user_id: 4, facility_id: 2, blood_type: "AB-", needed_by: "2025-12-03", status: "pending", patient_name: "Vikash Rughoobur", patient_phone_number: "57651209", message: "Urgent transfusion", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request5 = { blood_request_id: 5, user_id: 5, facility_id: 3, blood_type: "O+", needed_by: "2025-12-07", status: "completed", patient_name: "Sarah Latour", patient_phone_number: "59482211", message: "Emergency", quantity: 4, created_at: Time.now, completed_at: Time.now }
blood_request6 = { blood_request_id: 6, user_id: 6, facility_id: 1, blood_type: "A-", needed_by: "2025-12-01", status: "pending", patient_name: "Jason Ng", patient_phone_number: "58091344", message: "Blood donation required", quantity: 1, created_at: Time.now, completed_at: nil }
blood_request7 = { blood_request_id: 7, user_id: 7, facility_id: 4, blood_type: "B-", needed_by: "2025-12-15", status: "pending", patient_name: "Priya Seetohul", patient_phone_number: "57221198", message: "Urgent need", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request8 = { blood_request_id: 8, user_id: 8, facility_id: 3, blood_type: "AB+", needed_by: "2025-12-08", status: "completed", patient_name: "Miguel Da Silva", patient_phone_number: "59734122", message: "Surgery scheduled", quantity: 2, created_at: Time.now, completed_at: Time.now }
blood_request9 = { blood_request_id: 9, user_id: 9, facility_id: 2, blood_type: "O-", needed_by: "2025-12-12", status: "pending", patient_name: "Anjali Bhugaloo", patient_phone_number: "59120017", message: "Emergency transfusion", quantity: 3, created_at: Time.now, completed_at: nil }
blood_request10 = { blood_request_id: 10, user_id: 10, facility_id: 1, blood_type: "A+", needed_by: "2025-12-20", status: "completed", patient_name: "Dylan Clement", patient_phone_number: "57399821", message: "Surgery", quantity: 1, created_at: Time.now, completed_at: Time.now }
blood_request11 = { blood_request_id: 11, user_id: 11, facility_id: 3, blood_type: "B+", needed_by: "2025-12-11", status: "pending", patient_name: "Stephanie Wong", patient_phone_number: "59672210", message: "Blood required urgently", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request12 = { blood_request_id: 12, user_id: 12, facility_id: 2, blood_type: "O+", needed_by: "2025-12-18", status: "completed", patient_name: "Kunal Gopal", patient_phone_number: "58412390", message: "Accident victim", quantity: 4, created_at: Time.now, completed_at: Time.now }
blood_request13 = { blood_request_id: 13, user_id: 13, facility_id: 1, blood_type: "AB-", needed_by: "2025-12-05", status: "pending", patient_name: "Emma Ramasamy", patient_phone_number: "57982011", message: "Urgent need for surgery", quantity: 1, created_at: Time.now, completed_at: nil }
blood_request14 = { blood_request_id: 14, user_id: 14, facility_id: 4, blood_type: "A-", needed_by: "2025-12-09", status: "pending", patient_name: "Yannick Legrand", patient_phone_number: "59564401", message: "Transfusion required", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request15 = { blood_request_id: 15, user_id: 15, facility_id: 3, blood_type: "O+", needed_by: "2025-12-14", status: "completed", patient_name: "Lina Peerbux", patient_phone_number: "57812209", message: "Surgery", quantity: 3, created_at: Time.now, completed_at: Time.now }
blood_request16 = { blood_request_id: 16, user_id: 16, facility_id: 2, blood_type: "B-", needed_by: "2025-12-07", status: "pending", patient_name: "Thierry Labonte", patient_phone_number: "59382177", message: "Urgent request", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request17 = { blood_request_id: 17, user_id: 17, facility_id: 1, blood_type: "AB+", needed_by: "2025-12-13", status: "pending", patient_name: "Sanjana Mohit", patient_phone_number: "57720016", message: "Emergency surgery", quantity: 1, created_at: Time.now, completed_at: nil }
blood_request18 = { blood_request_id: 18, user_id: 18, facility_id: 4, blood_type: "A+", needed_by: "2025-12-19", status: "completed", patient_name: "Lucas Robert", patient_phone_number: "59831190", message: "Accident emergency", quantity: 3, created_at: Time.now, completed_at: Time.now }
blood_request19 = { blood_request_id: 19, user_id: 19, facility_id: 3, blood_type: "O-", needed_by: "2025-12-16", status: "pending", patient_name: "Melissa d’Hotman", patient_phone_number: "57123098", message: "Blood required", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request20 = { blood_request_id: 20, user_id: 20, facility_id: 2, blood_type: "B+", needed_by: "2025-12-22", status: "completed", patient_name: "Harish Bheekhun", patient_phone_number: "57689012", message: "Surgery", quantity: 1, created_at: Time.now, completed_at: Time.now }
blood_request21 = { blood_request_id: 21, user_id: 21, facility_id: 1, blood_type: "AB-", needed_by: "2025-12-11", status: "pending", patient_name: "Amira Rahim", patient_phone_number: "59071822", message: "Urgent transfusion", quantity: 3, created_at: Time.now, completed_at: nil }
blood_request22 = { blood_request_id: 22, user_id: 22, facility_id: 4, blood_type: "A-", needed_by: "2025-12-06", status: "pending", patient_name: "Jonathan Perrine", patient_phone_number: "58280117", message: "Blood needed for operation", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request23 = { blood_request_id: 23, user_id: 23, facility_id: 3, blood_type: "O+", needed_by: "2025-12-20", status: "completed", patient_name: "Shreya Oodit", patient_phone_number: "59320178", message: "Surgery", quantity: 1, created_at: Time.now, completed_at: Time.now }
blood_request24 = { blood_request_id: 24, user_id: 24, facility_id: 2, blood_type: "B-", needed_by: "2025-12-18", status: "pending", patient_name: "Andrew André", patient_phone_number: "59911032", message: "Emergency blood request", quantity: 2, created_at: Time.now, completed_at: nil }
blood_request25 = { blood_request_id: 25, user_id: 25, facility_id: 1, blood_type: "AB+", needed_by: "2025-12-21", status: "completed", patient_name: "Farah Abdool", patient_phone_number: "57192304", message: "Accident case", quantity: 3, created_at: Time.now, completed_at: Time.now }
blood_request26 = { blood_request_id: 26, user_id: 26, facility_id: 4, blood_type: "A+", needed_by: "2025-12-09", status: "pending", patient_name: "Ryan Cheung", patient_phone_number: "58870019", message: "Urgent transfusion", quantity: 1, created_at: Time.now, completed_at: nil }
blood_request27 = { blood_request_id: 27, user_id: 27, facility_id: 3, blood_type: "O-", needed_by: "2025-12-15", status: "completed", patient_name: "Neha Dowlut", patient_phone_number: "59011098", message: "Surgery", quantity: 2, created_at: Time.now, completed_at: Time.now }
