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
Facility.destroy_all

puts '🌱 Seeding hospitals and clinics in Mauritius...'

facilities = [
  { name: "Victoria", address: "Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "Hospital" },
  { name: "Jeevanjee Hospital", address: "Port Louis, Mauritius", phone_number: "2031002", facility_type: "Hospital" },
  { name: "Wellkin Hospital", address: "Moka, Mauritius", phone_number: "6051000", facility_type: "Hospital" },
  { name: "MedPoint Clinic", address: "Grand Baie, Mauritius", phone_number: "4267777", facility_type: "Clinic" },
  { name: "C-Care Darné", address: "Floréal, Mauritius", phone_number: "6012300", facility_type:"Clinic" },
  { name: "C-Care Moka", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "Clinic" },
  { name: "C-Care Tamarin", address: "Tamarin, Mauritius", phone_number: "4601900", facility_type: "Clinic" },
  { name: "Clinique du Nord", address: "Grand Baie, Mauritius", phone_number: "2472532", facility_type: "Clinic" },
  { name: "Victoria Clinic", address: "Quatre Bornes, Mauritius", phone_number: "4020800", facility_type: "Clinic" },
  { name: "Jeetoo Hospital", address: "Port Louis, Mauritius", phone_number: "2031001", facility_type: "Hospital" },
  { name: "Sun Medical Clinic", address: "Curepipe, Mauritius", phone_number: "6061300", facility_type: "Clinic" },
  { name: "Artemis Curepipe Hospital", address: "Curepipe,", phone_number: "6515050", facility_type: "Clinic" },
  { name: "C-Care Grand Baie", address: "Grand Baie, Mauritius", phone_number: "6012500", facility_type: "Clinic" },
  { name: "Premium Care Clinic", address: "Vacoas, Mauritius", phone_number: "4908128", facility_type: "Clinic" },
  { name: "Nirvaran Clinic", address: "Quatre Bornes, Mauritius", phone_number: "55063945", facility_type: "Clinic" },
  { name: "Clinique Ferrière", address: "Curepipe, Mauritius", phone_number: "6763332", facility_type: "Clinic" },
  { name: "Jawaharlal Nehru", address: "Rose Belle, Mauritius", phone_number: "6037000", facility_type: "Hospital" },
  { name: "RightNow Medical Hub", address: "Curepipe, Mauritius", phone_number: "54794843", facility_type: "Clinic" },
  { name: "City Clinic", address: "Port Louis, Mauritius", phone_number: "2011600", facility_type: "Clinic" },
  { name: "Medic World", address: "Quatre Bornes, Mauritius", phone_number: "4073000", facility_type: "Clinic" },
  { name: "Clinique Muller", address: "Curepipe, Mauritius", phone_number: "6702911", facility_type: "Clinic" },
  { name: "Phoenix Health Centre", address: "Vacoas, Mauritius", phone_number: "6964286", facility_type: "Clinic" },
  { name: "Rose Hill Centre", address: "Rose Hill, Mauritius", phone_number: "4541937", facility_type: "Clinic" },
  { name: "Medical Surgical Centre", address: "Floreal, Mauritius", phone_number: "6012300", facility_type: "Clinic" },
  { name: "Forest-Side Health Center", address: "Mauritius", phone_number: "6742647", facility_type: "Clinic" },
  { name: "Holyrood Community Centre", address: "Vacoas, Mauritius", phone_number: "6973073", facility_type: "Clinic" },
  { name: "Mahebourg Hospital", address: "Mahebourg, Mauritius", phone_number: "6042000", facility_type: "Hospital" },
  { name: "Eagle Clinic", address: "Central Flacq, Mauritius", phone_number: "4605500", facility_type: "Clinic" },
  { name: "Lady Sushil Ramgoolam", address: "Belveder, Mauritius", phone_number: "4181364", facility_type: "Clinic" }
]

facilities.each do |facility|
  Facility.create!(facility)
end

blood_requests = [
  {
    user_id: 1,
    facility_id: 1,
    blood_type: "A+",
    needed_by: Date.today + 3,
    status: "pending",
    patient_name: "Mark Doe",
    patient_phone_number: "52511111",
    message: "Urgent surgery scheduled.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 2,
    facility_id: 2,
    blood_type: "O-",
    needed_by: Date.today + 1,
    status: "pending",
    patient_name: "Linda Smith",
    patient_phone_number: "52522222",
    message: "Patient in critical condition.",
    quantity: 3,
    completed_at: nil
  },
  {
    user_id: 3,
    facility_id: 3,
    blood_type: "B+",
    needed_by: Date.today + 5,
    status: "pending",
    patient_name: "Sarah Brown",
    patient_phone_number: "52533333",
    message: "Routine transfusion.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 4,
    facility_id: 1,
    blood_type: "O+",
    needed_by: Date.today + 2,
    status: "completed",
    patient_name: "Tom Johnson",
    patient_phone_number: "52544444",
    message: "Emergency request completed.",
    quantity: 2,
    completed_at: Date.today - 1
  },
  {
    user_id: 5,
    facility_id: 2,
    blood_type: "AB+",
    needed_by: Date.today + 7,
    status: "pending",
    patient_name: "Emily Williams",
    patient_phone_number: "52555555",
    message: "Scheduled medical procedure.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 6,
    facility_id: 3,
    blood_type: "A-",
    needed_by: Date.today + 4,
    status: "pending",
    patient_name: "Oliver Jones",
    patient_phone_number: "52566666",
    message: "Urgent need for transfusion.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 7,
    facility_id: 1,
    blood_type: "B-",
    needed_by: Date.today + 2,
    status: "pending",
    patient_name: "Matthew Garcia",
    patient_phone_number: "52577777",
    message: "Severe anemia case.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 8,
    facility_id: 2,
    blood_type: "AB-",
    needed_by: Date.today + 6,
    status: "pending",
    patient_name: "Sophia Martinez",
    patient_phone_number: "52588888",
    message: "Rare blood type urgently needed.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 9,
    facility_id: 3,
    blood_type: "O+",
    needed_by: Date.today + 1,
    status: "completed",
    patient_name: "Chris Davis",
    patient_phone_number: "52599999",
    message: "Life-saving transfusion.",
    quantity: 2,
    completed_at: Date.today
  },
  {
    user_id: 10,
    facility_id: 1,
    blood_type: "A+",
    needed_by: Date.today + 3,
    status: "pending",
    patient_name: "Isabella Rodriguez",
    patient_phone_number: "52511112",
    message: "Scheduled surgery.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 11,
    facility_id: 2,
    blood_type: "B+",
    needed_by: Date.today + 2,
    status: "pending",
    patient_name: "Joshua Wilson",
    patient_phone_number: "52511113",
    message: "Urgent ward requirement.",
    quantity: 3,
    completed_at: nil
  },
  {
    user_id: 12,
    facility_id: 3,
    blood_type: "O-",
    needed_by: Date.today + 7,
    status: "pending",
    patient_name: "Mia Anderson",
    patient_phone_number: "52511114",
    message: "O- supply needed ASAP.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 13,
    facility_id: 1,
    blood_type: "AB+",
    needed_by: Date.today + 4,
    status: "pending",
    patient_name: "Andrew Thomas",
    patient_phone_number: "52511115",
    message: "Transplant support.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 14,
    facility_id: 2,
    blood_type: "A-",
    needed_by: Date.today + 5,
    status: "pending",
    patient_name: "Charlotte Taylor",
    patient_phone_number: "52511116",
    message: "Medical emergency.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 15,
    facility_id: 3,
    blood_type: "B+",
    needed_by: Date.today + 3,
    status: "completed",
    patient_name: "David Moore",
    patient_phone_number: "52511117",
    message: "Completed treatment.",
    quantity: 1,
    completed_at: Date.today
  },
  {
    user_id: 16,
    facility_id: 1,
    blood_type: "O+",
    needed_by: Date.today + 1,
    status: "pending",
    patient_name: "Amelia Jackson",
    patient_phone_number: "52511118",
    message: "Immediate assistance required.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 17,
    facility_id: 2,
    blood_type: "AB-",
    needed_by: Date.today + 6,
    status: "pending",
    patient_name: "Ryan White",
    patient_phone_number: "52511119",
    message: "Rare blood type request.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 18,
    facility_id: 3,
    blood_type: "A+",
    needed_by: Date.today + 3,
    status: "pending",
    patient_name: "Grace Harris",
    patient_phone_number: "52511120",
    message: "Transfusion for recovery.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 19,
    facility_id: 1,
    blood_type: "B-",
    needed_by: Date.today + 2,
    status: "pending",
    patient_name: "Ethan Martin",
    patient_phone_number: "52511121",
    message: "Accident trauma response.",
    quantity: 3,
    completed_at: nil
  },
  {
    user_id: 20,
    facility_id: 2,
    blood_type: "O+",
    needed_by: Date.today + 5,
    status: "pending",
    patient_name: "Chloe Thompson",
    patient_phone_number: "52511122",
    message: "Scheduled operation.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 21,
    facility_id: 3,
    blood_type: "A-",
    needed_by: Date.today + 4,
    status: "pending",
    patient_name: "Benjamin Garcia",
    patient_phone_number: "52511123",
    message: "Anemia treatment needed.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 22,
    facility_id: 1,
    blood_type: "AB+",
    needed_by: Date.today + 7,
    status: "pending",
    patient_name: "Ella Martinez",
    patient_phone_number: "52511124",
    message: "Support for rare condition.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 23,
    facility_id: 2,
    blood_type: "O-",
    needed_by: Date.today + 1,
    status: "pending",
    patient_name: "Alexander Robinson",
    patient_phone_number: "52511125",
    message: "Critical operation today.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 24,
    facility_id: 3,
    blood_type: "B+",
    needed_by: Date.today + 6,
    status: "pending",
    patient_name: "Lily Clark",
    patient_phone_number: "52511126",
    message: "Doctor-requested units.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 25,
    facility_id: 1,
    blood_type: "A+",
    needed_by: Date.today + 5,
    status: "pending",
    patient_name: "Samuel Lewis",
    patient_phone_number: "52511127",
    message: "Internal bleeding case.",
    quantity: 3,
    completed_at: nil
  },
  {
    user_id: 26,
    facility_id: 2,
    blood_type: "O+",
    needed_by: Date.today + 3,
    status: "pending",
    patient_name: "Hannah Walker",
    patient_phone_number: "52511128",
    message: "Plan for surgical procedure.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 27,
    facility_id: 3,
    blood_type: "B-",
    needed_by: Date.today + 2,
    status: "pending",
    patient_name: "Jack Hall",
    patient_phone_number: "52511129",
    message: "Blood loss from injury.",
    quantity: 2,
    completed_at: nil
  },
  {
    user_id: 28,
    facility_id: 1,
    blood_type: "O+",
    needed_by: Date.today + 4,
    status: "pending",
    patient_name: "Michael Doe",
    patient_phone_number: "52511130",
    message: "Chronic condition treatment.",
    quantity: 1,
    completed_at: nil
  },
  {
    user_id: 29,
    facility_id: 2,
    blood_type: "A-",
    needed_by: Date.today + 7,
    status: "pending",
    patient_name: "Jenny Smith",
    patient_phone_number: "52511131",
    message: "Monthly transfusion needed.",
    quantity: 2,
    completed_at: nil
  }
]
blood_requests.each { |req| BloodRequest.create!(req) }

puts "🩸 #{blood_requests.size} Blood Requests seeded successfully!"
