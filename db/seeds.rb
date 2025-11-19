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

puts "✅ Done seeding!"
