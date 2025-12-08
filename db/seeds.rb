require 'faker'
require 'open-uri'
require 'openssl'
require 'securerandom'


puts 'Cleaning database...'
# Destroy all previous records
Facility.destroy_all
User.destroy_all
BloodRequest.destroy_all
Donor.destroy_all
Donation.destroy_all
Notification.destroy_all

puts '🌱 Seeding facilities...'

# HOSPITALS (hospital)
facility1 = Facility.create(name: "Victoria Hospital", address: "Victoria Avenue, Candos, Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "hospital")
facility2 = Facility.create(name: "Jeevanjee Hospital", address: "Queen Mary Avenue, Port Louis, Mauritius", phone_number: "2031002", facility_type: "hospital")
facility3 = Facility.create(name: "Wellkin Hospital", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "hospital")
facility4 = Facility.create(name: "Jeetoo Hospital", address: "Volcy Pougnet Street, Port Louis, Mauritius", phone_number: "2031001", facility_type: "hospital")
facility5 = Facility.create(name: "Jawaharlal Nehru Hospital", address: "Rose Belle Main Road, Rose Belle, Mauritius", phone_number: "6037000", facility_type: "hospital")
facility6 = Facility.create(name: "Sir Seewoosagur Ramgoolam National Hospital", address: "Poudrière Street, Port Louis, Mauritius", phone_number: "2031000", facility_type: "hospital")
facility7 = Facility.create(name: "Dr. A. G. Jeetoo Hospital", address: "Volcy Pougnet Street, Port Louis, Mauritius", phone_number: "2031001", facility_type: "hospital")
facility8 = Facility.create(name: "Flacq Hospital", address: "Royal Road, Centre de Flacq, Mauritius", phone_number: "4139200", facility_type: "hospital")
facility9 = Facility.create(name: "Mahatma Gandhi Institute Hospital", address: "Moka Road, Moka, Mauritius", phone_number: "4331200", facility_type: "hospital")
facility10 = Facility.create(name: "Sir Charles Gaëtan Duval Hospital", address: "Coronation Avenue, Beau Bassin, Mauritius", phone_number: "4546600", facility_type: "hospital")
facility11 = Facility.create(name: "Long Mountain Hospital", address: "Long Mountain, Pamplemousses, Mauritius", phone_number: "2439001", facility_type: "hospital")
facility12 = Facility.create(name: "Brown Sequard Hospital", address: "Beau Bassin, Mauritius", phone_number: "4546300", facility_type: "hospital")
facility13 = Facility.create(name: "ENT Hospital", address: "Vacoas, Mauritius", phone_number: "6963800", facility_type: "hospital")
facility14 = Facility.create(name: "Dr. Bruno Cheong Hospital", address: "Forest Side, Curepipe, Mauritius", phone_number: "6750500", facility_type: "hospital")
facility15 = Facility.create(name: "Nouvelle Clinique Ferrière", address: "Royal Road, Curepipe, Mauritius", phone_number: "6701000", facility_type: "hospital")

# CLINICS (clinic)
facility16 = Facility.create(name: "MedPoint Clinic", address: "Royal Road, Grand Baie, Mauritius", phone_number: "4267777", facility_type: "clinic")
facility17 = Facility.create(name: "C-Care Darné", address: "Georges Guibert Street, Floréal, Mauritius", phone_number: "6012300", facility_type: "clinic")
facility18 = Facility.create(name: "C-Care Moka", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "clinic")
facility19 = Facility.create(name: "C-Care Tamarin", address: "District One, Royal Road, La Mivoie, Tamarin, Mauritius", phone_number: "4601900", facility_type: "clinic")
facility20 = Facility.create(name: "Clinique du Nord", address: "Royal Road, Grand Baie, Mauritius", phone_number: "2472532", facility_type: "clinic")
facility21 = Facility.create(name: "Victoria Clinic", address: "Sir Winston Churchill Street, Quatre Bornes, Mauritius", phone_number: "4020800", facility_type: "clinic")
facility22 = Facility.create(name: "Sun Medical Clinic", address: "Royal Road, Curepipe, Mauritius", phone_number: "6061300", facility_type: "clinic")
facility23 = Facility.create(name: "Artemis Curepipe Hospital", address: "Queen Elizabeth II Avenue, Curepipe, Mauritius", phone_number: "6515050", facility_type: "clinic")
facility24 = Facility.create(name: "C-Care Grand Baie", address: "Chemin Vinght Pied, Grand Baie, Mauritius", phone_number: "6012500", facility_type: "clinic")
facility25 = Facility.create(name: "Premium Care Clinic", address: "Beaux-Songes Link Road, Vacoas-Phoenix, Mauritius", phone_number: "4908128", facility_type: "clinic")
facility26 = Facility.create(name: "Nirvaran Clinic", address: "Bois Pignolet Road, Quatre Bornes, Mauritius", phone_number: "55063945", facility_type: "clinic")
facility27 = Facility.create(name: "Clinique Ferrière de Bon Secours", address: "Ferrière Street, Curepipe, Mauritius", phone_number: "6763332", facility_type: "clinic")
facility28 = Facility.create(name: "RightNow Medical Hub", address: "Royal Road, Curepipe, Mauritius", phone_number: "54794843", facility_type: "clinic")
facility29 = Facility.create(name: "City Clinic", address: "Sir Edgar Laurent Street, Port Louis, Mauritius", phone_number: "2061600", facility_type: "clinic")
facility30 = Facility.create(name: "Medic World", address: "5 Avenue Des Capucines, Quatre Bornes, Mauritius", phone_number: "2061600", facility_type: "clinic")
facility31 = Facility.create(name: "Clinique Muller (Ex-Lorette)", address: "Higginson Street, Curepipe, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility32 = Facility.create(name: "Clinique Bon Pasteur", address: "G. Pitot Street, Beau Bassin-Rose Hill, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility33 = Facility.create(name: "Phoenix Community Health Centre", address: "Edgar Quirin Avenue, Vacoas-Phoenix, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility34 = Facility.create(name: "Rose Hill Area Health Centre", address: "B1 Main Road, Beau Bassin-Rose Hill, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility35 = Facility.create(name: "Medical Surgical Centre Ltd", address: "Rue George Gilbert, Floréal, Curepipe, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility36 = Facility.create(name: "Forest-Side Community Health Center", address: "Forest Road, Curepipe, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility37 = Facility.create(name: "Holyrood Community Centre", address: "Reservoir Road, Vacoas-Phoenix, Mauritius", phone_number: 6703990, facility_type: "clinic")
facility38 = Facility.create(name: "Apollo Bramwell Hospital", address: "Moka, Mauritius", phone_number: "6051000", facility_type: "clinic")
facility39 = Facility.create(name: "Clinique de Lorette", address: "Higginson Street, Curepipe, Mauritius", phone_number: "6701513", facility_type: "clinic")
facility40 = Facility.create(name: "Clinique du Sud", address: "Royal Road, Mahébourg, Mauritius", phone_number: "6319329", facility_type: "clinic")

# BLOOD DONATION CENTERS (blood_donation_center)
facility41 = Facility.create(name: "National Blood Transfusion Service (NBTS) Headquarters", address: "Poudrière Street, Port Louis, Mauritius", phone_number: "2031000", facility_type: "blood_donation_center")
facility42 = Facility.create(name: "Victoria Hospital Blood Donation Centre", address: "Victoria Avenue, Candos, Quatre Bornes, Mauritius", phone_number: "4253031", facility_type: "blood_donation_center")
facility43 = Facility.create(name: "Jawaharlal Nehru Hospital Blood Bank", address: "Rose Belle Main Road, Rose Belle, Mauritius", phone_number: "6037000", facility_type: "blood_donation_center")
facility44 = Facility.create(name: "Flacq Hospital Blood Collection Centre", address: "Royal Road, Centre de Flacq, Mauritius", phone_number: "4139200", facility_type: "blood_donation_center")
facility45 = Facility.create(name: "Jeetoo Hospital Blood Donation Unit", address: "Volcy Pougnet Street, Port Louis, Mauritius", phone_number: "2031001", facility_type: "blood_donation_center")
facility46 = Facility.create(name: "SSRN Hospital Blood Transfusion Service", address: "Poudrière Street, Port Louis, Mauritius", phone_number: "2031000", facility_type: "blood_donation_center")
facility47 = Facility.create(name: "Wellkin Hospital Blood Collection Point", address: "Royal Road, Moka, Mauritius", phone_number: "6051000", facility_type: "blood_donation_center")
facility48 = Facility.create(name: "Moka Blood Donation Centre", address: "Moka Road, Moka, Mauritius", phone_number: "4331200", facility_type: "blood_donation_center")
facility49 = Facility.create(name: "Curepipe Blood Donation Centre", address: "Royal Road, Curepipe, Mauritius", phone_number: "6701000", facility_type: "blood_donation_center")
facility50 = Facility.create(name: "Rose-Hill Blood Donation Centre", address: "Coronation Avenue, Beau Bassin, Mauritius", phone_number: "4546600", facility_type: "blood_donation_center")
facility51 = Facility.create(name: "Plaine Verte Blood Donation Centre", address: "Rue de la Poudrière, Port Louis, Mauritius", phone_number: "2424877", facility_type: "blood_donation_center")
facility52 = Facility.create(name: "Rivière du Rempart Blood Collection Centre", address: "Royal Road, Rivière du Rempart, Mauritius", phone_number: "2839101", facility_type: "blood_donation_center")
facility53 = Facility.create(name: "Mahatma Gandhi Institute Blood Donation Centre", address: "Moka Road, Moka, Mauritius", phone_number: "4331200", facility_type: "blood_donation_center")
facility54 = Facility.create(name: "University of Mauritius Blood Donation Centre", address: "Réduit, Moka, Mauritius", phone_number: "4037400", facility_type: "blood_donation_center")
facility55 = Facility.create(name: "Red Cross Society of Mauritius - Blood Donation Centre", address: "Ste Thérèse Street, Curepipe, Mauritius", phone_number: "6751975", facility_type: "blood_donation_center")

puts "Creating facilities..."


puts "🌱 Seeding users..."
blood_types = ["A+", "A-", "B+", "B-", "O+", "O-", "AB+", "AB-"]
mauritius_cities = ["Port Louis", "Quatre Bornes", "Curepipe", "Beau Bassin", "Rose Belle", "Grand Baie", "Moka", "Flacq", "Tamarin", "Vacoas", "Phoenix", "Goodlands", "Mahebourg", "Calodyne", "Montagne Blanche", "Souillac", "Flic en Flac"]
mauritian_first_names = ["Anjali", "Jemilla", "Tom", "Richard", "Devon", "Priya", "Jean", "Marie", "Kevin", "Paul", "Aisha", "Sunil", "Tania", "Vikesh", "Yaasir", "Ikhlass", "Brandon", "Anne-Marie", "Deven", "Anil", "Dave", "Kristel", "Sofia", "Naziah", "Javed", "Aurelie"]
mauritian_last_names  = ["Gopaul", "Henri", "Bunwaree", "Ramsamy", "Richard", "Dulloo", "Kellock", "Paul", "Nundlall", "Mungur", "Gungadin", "Mungroo", "Ghanty", "Oomar", "Lee", "Cheekoree", "Lo-Hun", "Colin", "Ranglall", "Sobha", "Ramsaib", "Cheung", "Chen", "Annoar", "Brasse"]

users = 35.times.map do
  User.create!(
    first_name: mauritian_first_names.sample,
    last_name: mauritian_last_names.sample,
    date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 70),
    email: Faker::Internet.unique.email,
    password: "password123",
    phone: Faker::PhoneNumber.cell_phone,
    address: mauritius_cities.sample,
    blood_type: blood_types.sample,
    is_donor: [true, false].sample,
    avatar_url: "https://avatar.iran.liara.run/public?username=#{SecureRandom.hex(8)}"
  )
end

puts "🌱 Seeding blood requests..."
statuses = ["pending", "completed", "accepted"]

blood_requests = 20.times.map do
  accepted_user = [nil, users.sample].sample

  BloodRequest.create!(
    user: users.sample,
    facility: Facility.all.sample,
    blood_type: blood_types.sample,
    accepted_by_id: accepted_user&.id,   # <-- use it here
    needed_by: Faker::Date.forward(days: 30),
    status: statuses.sample,
    patient_name: Faker::Name.name,
    patient_phone_number: Faker::PhoneNumber.cell_phone,
    message: Faker::Lorem.sentence(word_count: 6),
    quantity: rand(1..5),
    created_at: Faker::Date.backward(days: 60),
    completed_at: [nil, Faker::Date.backward(days: 10)].sample
  )
end

puts "🌱 Seeding donors..."
donors = users.sample(20).map do |user|
  Donor.create!(
    user: user,
    donor_status: [true, false].sample,
    last_donation_date: Faker::Date.backward(days: 180),
    eligibility_status: [true, false].sample
  )
end

puts "🌱 Seeding donations..."
donations = 20.times.map do
  Donation.create!(
    donor: donors.sample,
    blood_request: blood_requests.sample,
    facility: Facility.all.sample,
    status: ["accepted", "rejected", "completed"].sample,
    created_at: Faker::Date.backward(days: 60)
  )
end

puts "🌱 Seeding notifications..."
notification_kinds = ["request_approved", "donor_available", "donation_accepted", "request_completed", "request_rejected", "donation_available"]

20.times do
  request = blood_requests.sample
  Notification.create!(
    user: request.user,
    notifiable_type: "BloodRequest",
    notifiable_id: request.id,
    kind: notification_kinds.sample,
    data: { message: Faker::Lorem.sentence }.to_json,
    read_at: [nil, Faker::Time.backward(days: 30)].sample,
    created_at: Faker::Time.backward(days: 60),
    blood_request_id: request.id
  )
end

puts "✅ Seeding completed!"
