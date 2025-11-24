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
  { name: "Victoria Hospital", address: "Volcy Pougnet Street, Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "hospital" },
  { name: "Jeevanjee Hospital", address: "12-14 Joseph Riviere Street, Port Louis, Mauritius", phone_number: "2031002", facility_type: "hospital" },
  { name: "Wellkin Hospital", address: "Moka, Mauritius", phone_number: "6051000", facility_type: "hospital" },
  { name: "MedPoint Clinic", address: "Royal Road, Grand Baie, Mauritius", phone_number: "4267777", facility_type: "clinic" },
  { name: "C-Care Darné", address: "Darné Road, Floréal, Mauritius", phone_number: "6012300", facility_type: "clinic" },
  { name: "C-Care Moka", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "clinic" },
  { name: "C-Care Tamarin", address: "Royal Road, Tamarin, Mauritius", phone_number: "4601900", facility_type: "clinic" },
  { name: "Clinique du Nord", address: "Royal Road, Grand Baie, Mauritius", phone_number: "2472532", facility_type: "clinic" },
  { name: "Victoria Clinic", address: "St Jean Road, Quatre Bornes, Mauritius", phone_number: "4020800", facility_type: "clinic" },
  { name: "Jeetoo Hospital", address: "Voley Pougnet Street, Port Louis, Mauritius", phone_number: "2031001", facility_type: "hospital" },
  { name: "Sun Medical Clinic", address: "Royal Road, Curepipe, Mauritius", phone_number: "6061300", facility_type: "clinic" },
  { name: "Artemis Curepipe Hospital", address: "Royal Road, Curepipe, Mauritius", phone_number: "6515050", facility_type: "clinic" },
  { name: "C-Care Grand Baie", address: "Royal Road, Grand Baie, Mauritius", phone_number: "6012500", facility_type: "clinic" },
  { name: "Premium Care Clinic", address: "St. Paul Road, Vacoas, Mauritius", phone_number: "4908128", facility_type: "clinic" },
  { name: "Nirvaran Clinic", address: "Braham Kumari Marg, Quatre Bornes, Mauritius", phone_number: "55063945", facility_type: "clinic" },
  { name: "Clinique Ferrière", address: "Royal Road, Curepipe, Mauritius", phone_number: "6763332", facility_type: "clinic" },
  { name: "Jawaharlal Nehru Hospital", address: "Rose Belle, Mauritius", phone_number: "6037000", facility_type: "hospital" },
  { name: "RightNow Medical Hub", address: "Royal Road, Curepipe, Mauritius", phone_number: "54794843", facility_type: "clinic" },
  { name: "City Clinic", address: "Sir William Newton Street, Port Louis, Mauritius", phone_number: "2011600", facility_type: "clinic" },
  { name: "Medic World", address: "Royal Road, Quatre Bornes, Mauritius", phone_number: "4073000", facility_type: "clinic" },
  { name: "Clinique Muller", address: "Royal Road, Curepipe, Mauritius", phone_number: "6702911", facility_type: "clinic" },
  { name: "Phoenix Health Centre", address: "Vacoas, Mauritius", phone_number: "6964286", facility_type: "clinic" },
  { name: "Rose Hill Centre", address: "Royal Road, Rose Hill, Mauritius", phone_number: "4541937", facility_type: "clinic" },
  { name: "Medical Surgical Centre", address: "Floreal, Mauritius", phone_number: "6012300", facility_type: "clinic" },
  # { name: "Forest-Side Health Center", address: "Forest-Side, Mauritius", phone_number: "6742647", facility_type: "clinic" },
  { name: "Holyrood Community Centre", address: "Holyrood Street, Vacoas, Mauritius", phone_number: "6973073", facility_type: "clinic" },
  { name: "Mahebourg Hospital", address: "Coastal Road, Mahebourg, Mauritius", phone_number: "6042000", facility_type: "hospital" },
  # { name: "Eagle Clinic", address: "Royal Road, Central Flacq, Mauritius", phone_number: "4605500", facility_type: "clinic" },
  { name: "Lady Sushil Ramgoolam Clinic", address: "Belvedere, Mauritius", phone_number: "4181364", facility_type: "clinic" }
]

facilities.each do |facility|
  Facility.create!(facility)
end

puts "✅ Done seeding!"

users = [
  {
    user_id: "user 001",
    first_name: "John",
    last_name: "Doe",
    date_of_birth: "1985-03-15",
    email: "john.doe@example.com",
    password: "password123",
    phone_number: "52512345",
    address: "Quatre Bornes, Mauritius"
  },
  {
    user_id: "user 002",
    first_name: "Sarah",
    last_name: "Ramsamy",
    date_of_birth: "1990-07-22",
    email: "sarah.ramsamy@example.com",
    password: "password123",
    phone_number: "58023456",
    address: "Port Louis, Mauritius"
  },
  {
    user_id: "user 003",
    first_name: "Kevin",
    last_name: "Pillay",
    date_of_birth: "1995-01-10",
    email: "kevin.pillay@example.com",
    password: "password123",
    phone_number: "59098765",
    address: "Curepipe, Mauritius"
  },
  {
    user_id: "user 004",
    first_name: "Anjali",
    last_name: "Kumar",
    date_of_birth: "1988-04-05",
    email: "anjali.kumar@example.com",
    password: "password123",
    phone_number: "59876543",
    address: "Rose Hill, Mauritius"
  },
  {
    user_id: "user 005",
    first_name: "Rakesh",
    last_name: "Singh",
    date_of_birth: "1979-12-19",
    email: "rakesh.singh@example.com",
    password: "password123",
    phone_number: "52654321",
    address: "Vacoas, Mauritius"
  },
  {
    user_id: "user 006",
    first_name: "Priya",
    last_name: "Nath",
    date_of_birth: "1992-11-11",
    email: "priya.nath@example.com",
    password: "password123",
    phone_number: "53456789",
    address: "Grand Baie, Mauritius"
  },
  {
    user_id: "user 007",
    first_name: "Arjun",
    last_name: "Patel",
    date_of_birth: "1983-06-25",
    email: "arjun.patel@example.com",
    password: "password123",
    phone_number: "54781234",
    address: "Flic en Flac, Mauritius"
  },
  {
    user_id: "user 008",
    first_name: "Leela",
    last_name: "Reddy",
    date_of_birth: "1996-09-17",
    email: "leela.reddy@example.com",
    password: "password123",
    phone_number: "55098765",
    address: "Mahebourg, Mauritius"
  },
  {
    user_id: "user 009",
    first_name: "Vikram",
    last_name: "Shah",
    date_of_birth: "1987-05-30",
    email: "vikram.shah@example.com",
    password: "password123",
    phone_number: "56012345",
    address: "Curepipe, Mauritius"
  },
  {
    user_id: "user 010",
    first_name: "Anita",
    last_name: "Chowdhury",
    date_of_birth: "1991-03-08",
    email: "anita.chowdhury@example.com",
    password: "password123",
    phone_number: "57890123",
    address: "Port Louis, Mauritius"
  },
  {
    user_id: "user 011",
    first_name: "Rohan",
    last_name: "Maharaj",
    date_of_birth: "1989-08-21",
    email: "rohan.maharaj@example.com",
    password: "password123",
    phone_number: "58765432",
    address: "Quatre Bornes, Mauritius"
  },
  {
    user_id: "user 012",
    first_name: "Nisha",
    last_name: "Dewan",
    date_of_birth: "1993-12-14",
    email: "nisha.dewan@example.com",
    password: "password123",
    phone_number: "59987654",
    address: "Grand Baie, Mauritius"
  },
  {
    user_id: "user 013",
    first_name: "Sanjay",
    last_name: "Bhandari",
    date_of_birth: "1981-02-02",
    email: "sanjay.bhandari@example.com",
    password: "password123",
    phone_number: "52345678",
    address: "Rose Hill, Mauritius"
  },
  {
    user_id: "user 014",
    first_name: "Meena",
    last_name: "Varma",
    date_of_birth: "1986-07-07",
    email: "meena.varma@example.com",
    password: "password123",
    phone_number: "53678901",
    address: "Vacoas, Mauritius"
  },
  {
    user_id: "user 015",
    first_name: "Aditya",
    last_name: "Singh",
    date_of_birth: "1994-04-28",
    email: "aditya.singh@example.com",
    password: "password123",
    phone_number: "54901234",
    address: "Flic en Flac, Mauritius"
  },
  {
    user_id: "user 016",
    first_name: "Priyanka",
    last_name: "Rai",
    date_of_birth: "1990-11-03",
    email: "priyanka.rai@example.com",
    password: "password123",
    phone_number: "55234567",
    address: "Curepipe, Mauritius"
  },
  {
    user_id: "user 017",
    first_name: "Rajesh",
    last_name: "Sharma",
    date_of_birth: "1982-06-15",
    email: "rajesh.sharma@example.com",
    password: "password123",
    phone_number: "56789012",
    address: "Mahebourg, Mauritius"
  },
  {
    user_id: "user 018",
    first_name: "Sunita",
    last_name: "Kapoor",
    date_of_birth: "1995-09-09",
    email: "sunita.kapoor@example.com",
    password: "password123",
    phone_number: "57654321",
    address: "Grand Baie, Mauritius"
  },
  {
    user_id: "user 019",
    first_name: "Manish",
    last_name: "Gupta",
    date_of_birth: "1984-12-20",
    email: "manish.gupta@example.com",
    password: "password123",
    phone_number: "58345678",
    address: "Port Louis, Mauritius"
  },
  {
    user_id: "user 020",
    first_name: "Kavita",
    last_name: "Chopra",
    date_of_birth: "1987-03-30",
    email: "kavita.chopra@example.com",
    password: "password123",
    phone_number: "59012345",
    address: "Quatre Bornes, Mauritius"
  },
  {
    user_id: "user 021",
    first_name: "Amit",
    last_name: "Desai",
    date_of_birth: "1988-08-18",
    email: "amit.desai@example.com",
    password: "password123",
    phone_number: "59876543",
    address: "Rose Hill, Mauritius"
  },
  {
    user_id: "user 022",
    first_name: "Rina",
    last_name: "Patel",
    date_of_birth: "1991-05-12",
    email: "rina.patel@example.com",
    password: "password123",
    phone_number: "50765432",
    address: "Vacoas, Mauritius"
  },
  {
    user_id: "user 023",
    first_name: "Vijay",
    last_name: "Nair",
    date_of_birth: "1983-01-25",
    email: "vijay.nair@example.com",
    password: "password123",
    phone_number: "51234567",
    address: "Curepipe, Mauritius"
  },
  {
    user_id: "user 024",
    first_name: "Nandini",
    last_name: "Rao",
    date_of_birth: "1996-10-11",
    email: "nandini.rao@example.com",
    password: "password123",
    phone_number: "51987654",
    address: "Flic en Flac, Mauritius"
  },
  {
    user_id: "user 025",
    first_name: "Harish",
    last_name: "Mehta",
    date_of_birth: "1980-07-03",
    email: "harish.mehta@example.com",
    password: "password123",
    phone_number: "52345679",
    address: "Grand Baie, Mauritius"
  },
  {
    user_id: "user 026",
    first_name: "Pooja",
    last_name: "Sharma",
    date_of_birth: "1992-02-28",
    email: "pooja.sharma@example.com",
    password: "password123",
    phone_number: "53098765",
    address: "Mahebourg, Mauritius"
  },
  {
    user_id: "user 027",
    first_name: "Raj",
    last_name: "Chand",
    date_of_birth: "1985-09-14",
    email: "raj.chand@example.com",
    password: "password123",
    phone_number: "54012345",
    address: "Quatre Bornes, Mauritius"
  }
]
