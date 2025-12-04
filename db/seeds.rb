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
facility31 = Facility.create(name: "Clinique Muller (Ex-Lorette)", address: "Higginson Street, Curepipe, Mauritius", phone_number: nil, facility_type: "clinic")
facility32 = Facility.create(name: "Clinique Bon Pasteur", address: "G. Pitot Street, Beau Bassin-Rose Hill, Mauritius", phone_number: nil, facility_type: "clinic")
facility33 = Facility.create(name: "Phoenix Community Health Centre", address: "Edgar Quirin Avenue, Vacoas-Phoenix, Mauritius", phone_number: nil, facility_type: "clinic")
facility34 = Facility.create(name: "Rose Hill Area Health Centre", address: "B1 Main Road, Beau Bassin-Rose Hill, Mauritius", phone_number: nil, facility_type: "clinic")
facility35 = Facility.create(name: "Medical Surgical Centre Ltd", address: "Rue George Gilbert, Floréal, Curepipe, Mauritius", phone_number: nil, facility_type: "clinic")
facility36 = Facility.create(name: "Forest-Side Community Health Center", address: "Forest Road, Curepipe, Mauritius", phone_number: nil, facility_type: "clinic")
facility37 = Facility.create(name: "Holyrood Community Centre", address: "Reservoir Road, Vacoas-Phoenix, Mauritius", phone_number: nil, facility_type: "clinic")
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

puts '🌱 Seeding users...'

user1 = User.create(first_name: "Aisha", last_name: "Ramdin", date_of_birth: "1993-04-12", email: "aisha.ramdin@example.com", password: "password123", phone: "57981234", address: "Quatre Bornes, Mauritius")
user2 = User.create(first_name: "Kevin", last_name: "Appadoo", date_of_birth: "1988-11-22", email: "kevin.appadoo@example.com", password: "password123", phone: "58564321", address: "Port Louis, Mauritius")
user3 = User.create(first_name: "Marie", last_name: "Duval", date_of_birth: "1990-02-03", email: "marie.duval@example.com", password: "password123", phone: "59210234", address: "Curepipe, Mauritius")
user4 = User.create(first_name: "Vikash", last_name: "Rughoobur", date_of_birth: "1995-07-14", email: "vikash.rughoobur@example.com", password: "password123", phone: "57651209", address: "Vacoas, Mauritius")
user5 = User.create(first_name: "Sarah", last_name: "Latour", date_of_birth: "1987-09-25", email: "sarah.latour@example.com", password: "password123", phone: "59482211", address: "Rose Hill, Mauritius")
user6 = User.create(first_name: "Jason", last_name: "Ng", date_of_birth: "1998-01-19", email: "jason.ng@example.com", password: "password123", phone: "58091344", address: "Beau Bassin, Mauritius")
user7 = User.create(first_name: "Priya", last_name: "Seetohul", date_of_birth: "1992-06-11", email: "priya.seetohul@example.com", password: "password123", phone: "57221198", address: "Flacq, Mauritius")
user8 = User.create(first_name: "Miguel", last_name: "Da Silva", date_of_birth: "1985-12-02", email: "miguel.dasilva@example.com", password: "password123", phone: "59734122", address: "Moka, Mauritius")
user9 = User.create(first_name: "Anjali", last_name: "Bhugaloo", date_of_birth: "1994-08-17", email: "anjali.bhugaloo@example.com", password: "password123", phone: "59120017", address: "Goodlands, Mauritius")
user10 = User.create(first_name: "Dylan", last_name: "Clement", date_of_birth: "1999-03-28", email: "dylan.clement@example.com", password: "password123", phone: "57399821", address: "Mahebourg, Mauritius")
user11 = User.create(first_name: "Stephanie", last_name: "Wong", date_of_birth: "1986-10-10", email: "stephanie.wong@example.com", password: "password123", phone: "59672210", address: "Port Louis, Mauritius")
user12 = User.create(first_name: "Kunal", last_name: "Gopal", date_of_birth: "1991-05-05", email: "kunal.gopal@example.com", password: "password123", phone: "58412390", address: "Triolet, Mauritius")
user13 = User.create(first_name: "Emma", last_name: "Ramasamy", date_of_birth: "2000-02-14", email: "emma.ramasamy@example.com", password: "password123", phone: "57982011", address: "Quatre Bornes, Mauritius")
user14 = User.create(first_name: "Yannick", last_name: "Legrand", date_of_birth: "1984-04-30", email: "yannick.legrand@example.com", password: "password123", phone: "59564401", address: "Curepipe, Mauritius")
user15 = User.create(first_name: "Lina", last_name: "Peerbux", date_of_birth: "1997-06-08", email: "lina.peerbux@example.com", password: "password123", phone: "57812209", address: "Vacoas, Mauritius")
user16 = User.create(first_name: "Thierry", last_name: "Labonte", date_of_birth: "1989-01-04", email: "thierry.labonte@example.com", password: "password123", phone: "59382177", address: "Grand Baie, Mauritius")
user17 = User.create(first_name: "Sanjana", last_name: "Mohit", date_of_birth: "1993-09-20", email: "sanjana.mohit@example.com", password: "password123", phone: "57720016", address: "Terre Rouge, Mauritius")
user18 = User.create(first_name: "Lucas", last_name: "Robert", date_of_birth: "1990-03-10", email: "lucas.robert@example.com", password: "password123", phone: "59831190", address: "Port Louis, Mauritius")
user19 = User.create(first_name: "Melissa", last_name: "d’Hotman", date_of_birth: "1996-07-01", email: "melissa.dhotman@example.com", password: "password123", phone: "57123098", address: "Floréal, Mauritius")
user20 = User.create(first_name: "Harish", last_name: "Bheekhun", date_of_birth: "1988-08-09", email: "harish.bheekhun@example.com", password: "password123", phone: "57689012", address: "Phoenix, Mauritius")
user21 = User.create(first_name: "Amira", last_name: "Rahim", date_of_birth: "1995-11-12", email: "amira.rahim@example.com", password: "password123", phone: "59071822", address: "Quatre Bornes, Mauritius")
user22 = User.create(first_name: "Jonathan", last_name: "Perrine", date_of_birth: "1987-02-23", email: "jonathan.perrine@example.com", password: "password123", phone: "58280117", address: "Curepipe, Mauritius")
user23 = User.create(first_name: "Shreya", last_name: "Oodit", date_of_birth: "1998-05-09", email: "shreya.oodit@example.com", password: "password123", phone: "59320178", address: "Moka, Mauritius")
user24 = User.create(first_name: "Andrew", last_name: "André", date_of_birth: "1985-10-16", email: "andrew.andre@example.com", password: "password123", phone: "59911032", address: "Rose Hill, Mauritius")
user25 = User.create(first_name: "Farah", last_name: "Abdool", date_of_birth: "1992-12-25", email: "farah.abdool@example.com", password: "password123", phone: "57192304", address: "Port Louis, Mauritius")
user26 = User.create(first_name: "Ryan", last_name: "Cheung", date_of_birth: "1991-03-29", email: "ryan.cheung@example.com", password: "password123", phone: "58870019", address: "Quatre Bornes, Mauritius")
user27 = User.create(first_name: "Neha", last_name: "Dowlut", date_of_birth: "1997-09-03", email: "neha.dowlut@example.com", password: "password123", phone: "59011098", address: "Triolet, Mauritius")

puts "🌱 Seeding for blood request"

blood_request1 = BloodRequest.create(user_id: user11, facility_id: facility1, blood_type: "A+", accepted_by_id: nil, needed_by: "2025-12-10", status: "pending", patient_name: "John Doe", patient_phone_number: "57981234", message: "Urgent transfusion needed", quantity: 2, created_at: Time.now, completed_at: nil)
blood_request2 = BloodRequest.create(user_id: user12, facility_id: facility2, blood_type: "O-", accepted_by_id: nil, needed_by: "2025-12-12", status: "completed", patient_name: "Alice Smith", patient_phone_number: "58564321", message: "Scheduled surgery", quantity: 3, created_at: Time.now, completed_at: Time.now - 2.days)
blood_request3 = BloodRequest.create(user_id: user13, facility_id: facility3, blood_type: "B+", accepted_by_id: nil, needed_by: "2025-12-15", status: "pending", patient_name: "Robert Brown", patient_phone_number: "59210234", message: "Accident case", quantity: 1, created_at: Time.now, completed_at: nil)
blood_request4 = BloodRequest.create(user_id: user14, facility_id: facility4, blood_type: "AB-", accepted_by_id: nil, needed_by: "2025-12-20", status: "completed", patient_name: "Mary Johnson", patient_phone_number: "57651209", message: "Emergency transfusion", quantity: 2, created_at: Time.now, completed_at: Time.now - 3.days)
blood_request5 = BloodRequest.create(user_id: user15, facility_id: facility5, blood_type: "A-", accepted_by_id: nil, needed_by: "2025-12-18", status: "pending", patient_name: "Michael Lee", patient_phone_number: "59482211", message: "Planned surgery", quantity: 4, created_at: Time.now, completed_at: nil)
blood_request6 = BloodRequest.create(user_id: user16, facility_id: facility6, blood_type: "O+", accepted_by_id: nil, needed_by: "2025-12-22", status: "completed", patient_name: "Emma Wilson", patient_phone_number: "58091344", message: "Urgent care", quantity: 2, created_at: Time.now, completed_at: Time.now - 1.day)
blood_request7 = BloodRequest.create(user_id: user17, facility_id: facility7, blood_type: "B-", accepted_by_id: nil, needed_by: "2025-12-24", status: "pending", patient_name: "Daniel Kim", patient_phone_number: "57221198", message: "Trauma case", quantity: 1, created_at: Time.now, completed_at: nil)
blood_request8 = BloodRequest.create(user_id: user18, facility_id: facility8, blood_type: "AB+", accepted_by_id: nil, needed_by: "2025-12-26", status: "completed", patient_name: "Sophia Martinez", patient_phone_number: "59734122", message: "Blood transfusion required", quantity: 3, created_at: Time.now, completed_at: Time.now - 2.days)
blood_request9 = BloodRequest.create(user_id: user19, facility_id: facility9, blood_type: "A+", accepted_by_id: nil, needed_by: "2025-12-28", status: "pending", patient_name: "James Anderson", patient_phone_number: "59120017", message: "Emergency surgery", quantity: 2, created_at: Time.now, completed_at: nil)
blood_request10 = BloodRequest.create(user_id: user10, facility_id: facility10, blood_type: "O-", accepted_by_id: nil, needed_by: "2025-12-30", status: "completed", patient_name: "Olivia Taylor", patient_phone_number: "57399821", message: "Blood needed urgently", quantity: 1, created_at: Time.now, completed_at: Time.now - 1.day)
blood_request11 = BloodRequest.create(user_id: user11, facility_id: facility11, blood_type: "B+", accepted_by_id: nil, needed_by: "2026-01-02", status: "pending", patient_name: "Ethan White", patient_phone_number: "59672210", message: "Scheduled procedure", quantity: 2, created_at: Time.now, completed_at: nil)
blood_request12 = BloodRequest.create(user_id: user12, facility_id: facility12, blood_type: "AB-", accepted_by_id: nil, needed_by: "2026-01-05", status: "completed", patient_name: "Chloe Hall", patient_phone_number: "58412390", message: "Accident transfusion", quantity: 1, created_at: Time.now, completed_at: Time.now - 4.days)
blood_request13 = BloodRequest.create(user_id: user13, facility_id: facility13, blood_type: "A-", accepted_by_id: nil, needed_by: "2026-01-07", status: "pending", patient_name: "Liam Scott", patient_phone_number: "57982011", message: "Urgent need", quantity: 3, created_at: Time.now, completed_at: nil)
blood_request14 = BloodRequest.create(user_id: user14, facility_id: facility14, blood_type: "O+", accepted_by_id: nil, needed_by: "2026-01-10", status: "completed", patient_name: "Ava Young", patient_phone_number: "59564401", message: "Blood transfusion", quantity: 2, created_at: Time.now, completed_at: Time.now - 1.day)
blood_request15 = BloodRequest.create(user_id: user15, facility_id: facility15, blood_type: "B-", accepted_by_id: nil, needed_by: "2026-01-12", status: "pending", patient_name: "Noah King", patient_phone_number: "57812209", message: "Surgery planned", quantity: 1, created_at: Time.now, completed_at: nil)
blood_request16 = BloodRequest.create(user_id: user16, facility_id: facility16, blood_type: "AB+", accepted_by_id: nil, needed_by: "2026-01-15", status: "completed", patient_name: "Mia Wright", patient_phone_number: "59382177", message: "Emergency transfusion", quantity: 2, created_at: Time.now, completed_at: Time.now - 3.days)
blood_request17 = BloodRequest.create(user_id: user17, facility_id: facility17, blood_type: "A+", accepted_by_id: nil, needed_by: "2026-01-17", status: "pending", patient_name: "Lucas Green", patient_phone_number: "57720016", message: "Urgent surgery", quantity: 3, created_at: Time.now, completed_at: nil)
blood_request18 = BloodRequest.create(user_id: user18, facility_id: facility18, blood_type: "O-", accepted_by_id: nil, needed_by: "2026-01-20", status: "completed", patient_name: "Sophia Adams", patient_phone_number: "59831190", message: "Blood needed", quantity: 1, created_at: Time.now, completed_at: Time.now - 2.days)
blood_request19 = BloodRequest.create(user_id: user19, facility_id: facility19, blood_type: "B+", accepted_by_id: nil, needed_by: "2026-01-22", status: "pending", patient_name: "Mason Baker", patient_phone_number: "57123098", message: "Scheduled transfusion", quantity: 2, created_at: Time.now, completed_at: nil)
blood_request20 = BloodRequest.create(user_id: user20, facility_id: facility20, blood_type: "AB-", accepted_by_id: nil, needed_by: "2026-01-25", status: "completed", patient_name: "Isabella Nelson", patient_phone_number: "57689012", message: "Urgent need", quantity: 3, created_at: Time.now, completed_at: Time.now - 1.day)
blood_request21 = BloodRequest.create(user_id: user21, facility_id: facility21, blood_type: "A-", accepted_by_id: nil, needed_by: "2026-01-27", status: "pending", patient_name: "Evelyn Carter", patient_phone_number: "59071822", message: "Surgery planned", quantity: 1, created_at: Time.now, completed_at: nil)
blood_request22 = BloodRequest.create(user_id: user22, facility_id: facility22, blood_type: "O+", accepted_by_id: nil, needed_by: "2026-01-30", status: "completed", patient_name: "Liam Mitchell", patient_phone_number: "58280117", message: "Blood transfusion", quantity: 2, created_at: Time.now, completed_at: Time.now - 2.days)
blood_request23 = BloodRequest.create(user_id: user23, facility_id: facility23, blood_type: "B-", accepted_by_id: nil, needed_by: "2026-02-02", status: "pending", patient_name: "Aria Perez", patient_phone_number: "59320178", message: "Emergency transfusion", quantity: 1, created_at: Time.now, completed_at: nil)
blood_request24 = BloodRequest.create(user_id: user24, facility_id: facility24, blood_type: "AB+", accepted_by_id: nil, needed_by: "2026-02-05", status: "completed", patient_name: "James Morris", patient_phone_number: "59911032", message: "Urgent surgery", quantity: 2, created_at: Time.now, completed_at: Time.now - 3.days)
blood_request25 = BloodRequest.create(user_id: user25, facility_id: facility25, blood_type: "A+", accepted_by_id: nil, needed_by: "2026-02-07", status: "pending", patient_name: "Ella Rogers", patient_phone_number: "57192304", message: "Scheduled transfusion", quantity: 1, created_at: Time.now, completed_at: nil)
blood_request26 = BloodRequest.create(user_id: user26, facility_id: facility26, blood_type: "O-", accepted_by_id: nil, needed_by: "2026-02-10", status: "completed", patient_name: "Benjamin Kelly", patient_phone_number: "58870019", message: "Emergency case", quantity: 3, created_at: Time.now, completed_at: Time.now - 1.day)
blood_request27 = BloodRequest.create(user_id: user27, facility_id: facility27, blood_type: "B+", accepted_by_id: nil, needed_by: "2026-02-12", status: "pending", patient_name: "Grace Hughes", patient_phone_number: "59011098", message: "Urgent transfusion", quantity: 2, created_at: Time.now, completed_at: nil)


puts "🌱 Seeding Donors..."
donor1 = Donor.create(user_id: user1, donor_status: true, last_donation_date: "2025-06-12", eligibility_status: true)
donor2 = Donor.create(user_id: user2, donor_status: true, last_donation_date: "2025-05-20", eligibility_status: true)
donor3 = Donor.create(user_id: user3, donor_status: false, last_donation_date: "2025-01-15", eligibility_status: false)
donor4 = Donor.create(user_id: user4, donor_status: true, last_donation_date: "2025-03-08", eligibility_status: true)
donor5 = Donor.create(user_id: user5, donor_status: false, last_donation_date: "2024-12-22", eligibility_status: false)
donor6 = Donor.create(user_id: user6, donor_status: true, last_donation_date: "2025-02-11", eligibility_status: true)
donor7 = Donor.create(user_id: user7, donor_status: true, last_donation_date: "2025-04-17", eligibility_status: true)
donor8 = Donor.create(user_id: user8, donor_status: false, last_donation_date: "2025-01-30", eligibility_status: false)
donor9 = Donor.create(user_id: user9, donor_status: true, last_donation_date: "2025-06-05", eligibility_status: true)
donor10 = Donor.create(user_id: user10, donor_status: true, last_donation_date: "2025-03-25", eligibility_status: true)

puts "🌱 Seeding donations ..."
donation1 = Donation.create(donor_id: donor1, blood_request_id: blood_request1, facility_id: facility1, status: "accepted", created_at: "2025-06-01")
donation2 = Donation.create(donor_id: donor2, blood_request_id: blood_request2, facility_id: facility2, status: "rejected", created_at: "2025-05-20")
donation3 = Donation.create(donor_id: donor3, blood_request_id: blood_request3, facility_id: facility3, status: "completed", created_at: "2025-04-15")
donation4 = Donation.create(donor_id: donor4, blood_request_id: blood_request4, facility_id: facility4, status: "accepted", created_at: "2025-03-28")
donation5 = Donation.create(donor_id: donor5, blood_request_id: blood_request5, facility_id: facility5, status: "rejected", created_at: "2025-02-14")
donation6 = Donation.create(donor_id: donor6, blood_request_id: blood_request6, facility_id: facility6, status: "completed", created_at: "2025-01-30")
donation7 = Donation.create(donor_id: donor7, blood_request_id: blood_request7, facility_id: facility7, status: "accepted", created_at: "2025-06-05")
donation8 = Donation.create(donor_id: donor8, blood_request_id: blood_request8, facility_id: facility8, status: "rejected", created_at: "2025-05-12")
donation9 = Donation.create(donor_id: donor9, blood_request_id: blood_request9, facility_id: facility9, status: "completed", created_at: "2025-04-20")
donation10 = Donation.create(donor_id: donor10, blood_request_id: blood_request10, facility_id: facility10, status: "accepted", created_at: "2025-03-15")
donation11 = Donation.create(donor_id: donor1, blood_request_id: blood_request11, facility_id: facility11, status: "rejected", created_at: "2025-02-28")
donation12 = Donation.create(donor_id: donor2, blood_request_id: blood_request12, facility_id: facility12, status: "completed", created_at: "2025-01-10")
donation13 = Donation.create(donor_id: donor3, blood_request_id: blood_request13, facility_id: facility13, status: "accepted", created_at: "2025-06-10")
donation14 = Donation.create(donor_id: donor4, blood_request_id: blood_request14, facility_id: facility14, status: "rejected", created_at: "2025-05-05")
donation15 = Donation.create(donor_id: donor5, blood_request_id: blood_request15, facility_id: facility15, status: "completed", created_at: "2025-04-08")
donation16 = Donation.create(donor_id: donor6, blood_request_id: blood_request16, facility_id: facility16, status: "accepted", created_at: "2025-03-01")
donation17 = Donation.create(donor_id: donor7, blood_request_id: blood_request17, facility_id: facility17, status: "rejected", created_at: "2025-02-20")
donation18 = Donation.create(donor_id: donor8, blood_request_id: blood_request18, facility_id: facility18, status: "completed", created_at: "2025-01-15")
donation19 = Donation.create(donor_id: donor9, blood_request_id: blood_request19, facility_id: facility19, status: "accepted", created_at: "2025-06-12")
donation20 = Donation.create(donor_id: donor10, blood_request_id: blood_request20, facility_id: facility20, status: "rejected", created_at: "2025-05-22")
donation21 = Donation.create(donor_id: donor1, blood_request_id: blood_request21, facility_id: facility21, status: "completed", created_at: "2025-04-18")
donation22 = Donation.create(donor_id: donor2, blood_request_id: blood_request22, facility_id: facility22, status: "accepted", created_at: "2025-03-12")
donation23 = Donation.create(donor_id: donor3, blood_request_id: blood_request23, facility_id: facility23, status: "rejected", created_at: "2025-02-25")
donation24 = Donation.create(donor_id: donor4, blood_request_id: blood_request24, facility_id: facility24, status: "completed", created_at: "2025-01-08")
donation25 = Donation.create(donor_id: donor5, blood_request_id: blood_request25, facility_id: facility25, status: "accepted", created_at: "2025-06-08")
donation26 = Donation.create(donor_id: donor6, blood_request_id: blood_request26, facility_id: facility26, status: "rejected", created_at: "2025-05-18")
donation27 = Donation.create(donor_id: donor7, blood_request_id: blood_request27, facility_id: facility27, status: "completed", created_at: "2025-04-02")



puts "🌱 Seeding notifications ..."

# Since 'message' column doesn't exist, we'll store messages in the 'data' field as JSON
# and use 'kind' to specify the notification type

notification1 = Notification.create(
  user_id: user1.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request1.id,
  kind: "request_approved",
  data: { message: "Your blood request has been approved." }.to_json,
  read_at: "2025-06-01 10:05",
  created_at: "2025-06-01 10:05",
  blood_request_id: blood_request1.id
)

notification2 = Notification.create(
  user_id: user2.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request2.id,
  kind: "donor_available",
  data: { message: "New donor available for your request." }.to_json,
  read_at: nil,
  created_at: "2025-05-28 09:40",
  blood_request_id: blood_request2.id
)

notification3 = Notification.create(
  user_id: user3.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request3.id,
  kind: "donation_accepted",
  data: { message: "Your donation has been accepted." }.to_json,
  read_at: "2025-05-25 11:20",
  created_at: "2025-05-25 11:20",
  blood_request_id: blood_request3.id
)

notification4 = Notification.create(
  user_id: user4.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request4.id,
  kind: "request_completed",
  data: { message: "Blood request completed successfully." }.to_json,
  read_at: nil,
  created_at: "2025-05-23 14:15",
  blood_request_id: blood_request4.id
)

notification5 = Notification.create(
  user_id: user5.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request5.id,
  kind: "request_rejected",
  data: { message: "Your blood request was rejected." }.to_json,
  read_at: "2025-05-21 16:40",
  created_at: "2025-05-21 16:40",
  blood_request_id: blood_request5.id
)

notification6 = Notification.create(
  user_id: user6.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request6.id,
  kind: "donation_available",
  data: { message: "New donation available for your request." }.to_json,
  read_at: nil,
  created_at: "2025-05-19 12:35",
  blood_request_id: blood_request6.id
)

notification7 = Notification.create(
  user_id: user7.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request7.id,
  kind: "donor_confirmed",
  data: { message: "Your donor has confirmed the donation." }.to_json,
  read_at: "2025-05-17 10:50",
  created_at: "2025-05-17 10:50",
  blood_request_id: blood_request7.id
)

notification8 = Notification.create(
  user_id: user8.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request8.id,
  kind: "facility_assigned",
  data: { message: "Blood request has been assigned to a facility." }.to_json,
  read_at: nil,
  created_at: "2025-05-15 09:55",
  blood_request_id: blood_request8.id
)

notification9 = Notification.create(
  user_id: user9.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request9.id,
  kind: "donation_scheduled",
  data: { message: "Your donation is scheduled for tomorrow." }.to_json,
  read_at: "2025-05-13 15:10",
  created_at: "2025-05-13 15:10",
  blood_request_id: blood_request9.id
)

notification10 = Notification.create(
  user_id: user10.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request10.id,
  kind: "request_pending",
  data: { message: "Blood request pending approval." }.to_json,
  read_at: nil,
  created_at: "2025-05-11 08:50",
  blood_request_id: blood_request10.id
)

notification11 = Notification.create(
  user_id: user1.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request11.id,
  kind: "donation_completed",
  data: { message: "Your donation has been completed." }.to_json,
  read_at: "2025-05-09 14:25",
  created_at: "2025-05-09 14:25",
  blood_request_id: blood_request11.id
)

notification12 = Notification.create(
  user_id: user2.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request12.id,
  kind: "donor_assigned",
  data: { message: "New donor assigned to your request." }.to_json,
  read_at: nil,
  created_at: "2025-05-07 10:55",
  blood_request_id: blood_request12.id
)

notification13 = Notification.create(
  user_id: user3.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request13.id,
  kind: "request_processing",
  data: { message: "Your blood request is being processed." }.to_json,
  read_at: "2025-05-05 11:30",
  created_at: "2025-05-05 11:30",
  blood_request_id: blood_request13.id
)

notification14 = Notification.create(
  user_id: user4.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request14.id,
  kind: "donation_successful",
  data: { message: "Donation successfully completed." }.to_json,
  read_at: nil,
  created_at: "2025-05-03 16:50",
  blood_request_id: blood_request14.id
)

notification15 = Notification.create(
  user_id: user5.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request15.id,
  kind: "request_cancelled",
  data: { message: "Your blood request has been cancelled." }.to_json,
  read_at: "2025-05-01 13:20",
  created_at: "2025-05-01 13:20",
  blood_request_id: blood_request15.id
)

notification16 = Notification.create(
  user_id: user6.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request16.id,
  kind: "donor_accepted",
  data: { message: "New donor accepted your request." }.to_json,
  read_at: nil,
  created_at: "2025-04-29 09:50",
  blood_request_id: blood_request16.id
)

notification17 = Notification.create(
  user_id: user7.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request17.id,
  kind: "awaiting_confirmation",
  data: { message: "Blood request awaiting confirmation." }.to_json,
  read_at: "2025-04-27 12:35",
  created_at: "2025-04-27 12:35",
  blood_request_id: blood_request17.id
)

notification18 = Notification.create(
  user_id: user8.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request18.id,
  kind: "scheduled_successful",
  data: { message: "Donation scheduled successfully." }.to_json,
  read_at: nil,
  created_at: "2025-04-25 14:55",
  blood_request_id: blood_request18.id
)

notification19 = Notification.create(
  user_id: user9.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request19.id,
  kind: "request_finalized",
  data: { message: "Your blood request is completed." }.to_json,
  read_at: "2025-04-23 10:25",
  created_at: "2025-04-23 10:25",
  blood_request_id: blood_request19.id
)

notification20 = Notification.create(
  user_id: user10.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request20.id,
  kind: "donor_assigned",
  data: { message: "New donor has been assigned." }.to_json,
  read_at: nil,
  created_at: "2025-04-21 15:15",
  blood_request_id: blood_request20.id
)

notification21 = Notification.create(
  user_id: user1.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request21.id,
  kind: "confirmation_received",
  data: { message: "Donation confirmation received." }.to_json,
  read_at: "2025-04-19 09:55",
  created_at: "2025-04-19 09:55",
  blood_request_id: blood_request21.id
)

notification22 = Notification.create(
  user_id: user2.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request22.id,
  kind: "request_approved",
  data: { message: "Blood request approved successfully." }.to_json,
  read_at: nil,
  created_at: "2025-04-17 11:50",
  blood_request_id: blood_request22.id
)

notification23 = Notification.create(
  user_id: user3.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request23.id,
  kind: "donation_rejected",
  data: { message: "Donation rejected by the facility." }.to_json,
  read_at: "2025-04-15 13:35",
  created_at: "2025-04-15 13:35",
  blood_request_id: blood_request23.id
)

notification24 = Notification.create(
  user_id: user4.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request24.id,
  kind: "donor_en_route",
  data: { message: "Your donor is on the way." }.to_json,
  read_at: nil,
  created_at: "2025-04-13 08:25",
  blood_request_id: blood_request24.id
)

notification25 = Notification.create(
  user_id: user5.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request25.id,
  kind: "pending_confirmation",
  data: { message: "Blood request pending donor confirmation." }.to_json,
  read_at: "2025-04-11 10:15",
  created_at: "2025-04-11 10:15",
  blood_request_id: blood_request25.id
)

notification26 = Notification.create(
  user_id: user6.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request26.id,
  kind: "donation_completed",
  data: { message: "Donation completed successfully." }.to_json,
  read_at: nil,
  created_at: "2025-04-09 12:45",
  blood_request_id: blood_request26.id
)

notification27 = Notification.create(
  user_id: user7.id,
  notifiable_type: "BloodRequest",
  notifiable_id: blood_request27.id,
  kind: "request_updated",
  data: { message: "Blood request has been updated." }.to_json,
  read_at: "2025-04-07 14:35",
  created_at: "2025-04-07 14:35",
  blood_request_id: blood_request27.id
)
