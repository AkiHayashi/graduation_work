user1 = User.create(
  login_name: "ゲスト",
  password: 'password',
  admin: false
)

Account.create(
  name: Faker::Name.first_name, 
  birth_date: DateTime.now - 10_000, 
  icon: Rails.root.join("db/fixtures/images/user1.png").open,
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: 00000000,
  allergy: "無し", 
  admin: false, 
  user_id: user1.id
)

user2 =  User.create(
  login_name: "家族１",
  password: 'password',
  admin: false
)

Account.create(
  name: Faker::Name.first_name, 
  birth_date: DateTime.now - 10_000, 
  icon: Rails.root.join("db/fixtures/images/user2.png").open,
  mail: Faker::Internet.email,
  address: Faker::Address.city, 
  tel: 00000000, 
  allergy: "無し", 
  admin: false, 
  user_id: user2.id
)

user3 =  User.create(
  login_name: "家族２",
  password: 'password',
  admin: false
)
Account.create(
  name: Faker::Name.first_name, 
  birth_date: DateTime.now - 10_000, 
  icon: Rails.root.join("db/fixtures/images/user3.png").open,
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: 00000000, 
  allergy: "無し", 
  admin: false, 
  user_id: user3.id
)

user4 =  User.create(
  login_name: "家族３",
  password: 'password',
  admin: false
)
Account.create(
  name: Faker::Name.first_name, 
  birth_date: DateTime.now - 10_000, 
  icon:Rails.root.join("db/fixtures/images/user4.png").open,
  mail: "ex@ex.com", 
  address: Faker::Address.city, 
  tel: 00000000, 
  allergy: "無し", 
  admin: false, 
  user_id: user4.id
)



admin_user =  User.create(
  login_name: "ゲスト管理者",
  password: 'password',
  admin: true
)

Account.create(
  name: Faker::Name.first_name, 
  birth_date: DateTime.now - 10_000, 
  icon:Rails.root.join("db/fixtures/images/admin_user.png").open,
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: 00000000, 
  allergy: "無し", 
  admin: true, 
  user_id: admin_user.id
)

medical_history1 = MedicalHistory.create(
  name: '胸部大動脈瘤', 
  start_on: DateTime.now - 1_000, 
  surgery: '人工血管置換術', 
  surgery_on: DateTime.now - 980, 
  user_id: user1.id
)

medical_history2 = MedicalHistory.create(
  name: '高脂血症', 
  start_on: DateTime.now - 1_5000, 
  surgery: '', 
  surgery_on: '', 
  user_id: user1.id
)

Hospital.create(
  name: "hospital1", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medical_history_id: medical_history1.id
)

Hospital.create(
  name: "hospital2", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medical_history_id: medical_history2.id
)

medical_history3 = MedicalHistory.create(
  name: '胆嚢結石症', 
  start_on: DateTime.now - 1_000, 
  surgery: '腹腔鏡下胆のう摘出手術', 
  surgery_on: DateTime.now - 980, 
  user_id: user2.id
)

Hospital.create(
  name: "hospital3", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medical_history_id: medical_history3.id
)

medical_history4 = MedicalHistory.create(
  name: '脳梗塞', 
  start_on: DateTime.now - 1_000, 
  surgery: '', 
  surgery_on: '', 
  user_id: user3.id
)

Hospital.create(
  name: "hospital4", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medical_history_id: medical_history4.id
)

medical_history5 = MedicalHistory.create(
  name: '右橈骨遠位端骨折', 
  start_on: DateTime.now - 80, 
  surgery: '', 
  surgery_on: '', 
  user_id: admin_user.id
)

Hospital.create(
  name: "hospital5", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medical_history_id: medical_history5.id
)

medication_history1 = MedicationHistory.create(
    name: "medication1", 
    usage: '内服', 
    prescription_on: DateTime.now - 10, 
    note: '', 
    user_id: user1.id
)

pharmacy1 = Pharmacy.create(
  name: 'pharmacy1', 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medication_history_id: medication_history1.id
)

pharmacy2 = Pharmacy.create(
  name: 'pharmacy1', 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.phone_number, 
  medication_history_id: MedicalHistory.second
)

medication_history2 = 5.times do |n|
MedicationHistory.create(
    name: "medication#{n+1}", 
    usage: '内服', 
    prescription_on: DateTime.now - 30, 
    note: '', 
    user_id: user2.id
  )
end

medication_history3 = 5.times do |n|
MedicationHistory.create(
    name: "medication#{n}", 
    usage: '内服', 
    prescription_on: DateTime.now - 25, 
    note: '', 
    user_id: user3.id
  )
end

# Pharmacy.create(
#   name: 'pharmacy3', 
#   address: Faker::Address.city, 
#   tel: Faker::PhoneNumber.phone_number, 
#   medication_history_id: medication_history3.ids
# )

medication_history4 = 5.times do |n|
MedicationHistory.create(
    name: "medication#{n}", 
    usage: '内服', 
    prescription_on: DateTime.now - 15, 
    note: '', 
    user_id: admin_user.id
  )
end

# Pharmacy.create(
#   name: 'pharmacy4', 
#   address: Faker::Address.city, 
#   tel: Faker::PhoneNumber.phone_number, 
#   medication_history_id: medication_history4.id
# )

family1 = Family.create(
  name: Faker::Name.last_name , 
  image:Rails.root.join("db/images/family.png").open,
  user_id: user1.id
)

5.times do |n|
  Family.create(
    name: Faker::Name.last_name , 
    image:Rails.root.join("db/images/family.png").open,
  )
end

Member.create(
  family_id: family1.id,
  user_id: user1.id
)

Member.create(
  family_id: family1.id,
  user_id: user2.id
)

Member.create(
  family_id: family1.id,
  user_id: user3.id
)

Member.create(
  family_id: family1.id,
  user_id: admin_user.id
)

diary1 = Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary1.png").open, 
  user_id: user1.id
)
# image: Rails.root.join("public/images/diary1.jpg").open, 

diary2 = Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary2.png").open, 
  user_id: user1.id
)

diary3 = Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary3.png").open,
  user_id: user2.id
)
Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary4.png").open, 
  user_id: user2.id
)
Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary5.png").open, 
  user_id: user3.id
)
Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary6.png").open,
  user_id: user3.id
)
Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary7.png").open, 
  user_id: admin_user.id
)
Diary.create(
  title: Faker::Book.title, 
  content: Faker::Quote.famous_last_words, 
  image: Rails.root.join("db/images/diary8.png").open,
  user_id: admin_user.id
)

20.times do |n|
  HealthStatus.create(
  systolic: rand(100..130), 
  diastolic: rand(80..110), 
  pulse: rand(80..90), 
  condition: "おなかいたい", 
  user_id: user1.id,
  created_at: Faker::Date.between(from: 5.days.ago, to: Date.today)
)
end

5.times do |n|
  HealthStatus.create(
  systolic: rand(100..130), 
  diastolic: rand(80..110), 
  pulse: rand(80..90), 
  condition: "元気", 
  user_id: user2.id,
  created_at: Faker::Date.between(from: 5.days.ago, to: Date.today)
)
end

5.times do |n|
  HealthStatus.create(
  systolic: rand(100..130), 
  diastolic: rand(80..110), 
  pulse: rand(80..90), 
  condition: "まあまあ", 
  user_id: user3.id,
  created_at: Faker::Date.between(from: 5.days.ago, to: Date.today)
)
end

5.times do |n|
  HealthStatus.create(
  systolic: rand(100..130), 
  diastolic: rand(80..110), 
  pulse: rand(80..90), 
  condition: "良好", 
  user_id: admin_user.id,
  created_at: Faker::Date.between(from: 5.days.ago, to: Date.today)
)
end

Favorite.create(
  user_id: user1.id,
  diary_id: diary1.id
)
Favorite.create(
  user_id: user1.id,
  diary_id: diary2.id
)
Favorite.create(
  user_id: user2.id,
  diary_id: diary1.id
)
Favorite.create(
  user_id: user2.id,
  diary_id: diary2.id
)
Favorite.create(
  user_id: user3.id,
  diary_id: diary1.id
)
