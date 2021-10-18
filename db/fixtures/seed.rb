user1 = User.create(
  login_name: "user1",
  password: 'password',
  admin: false
)

Account.create(
  name: "ユーザー1", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open("./public/images/user1.jpg"),
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.cell_phone,
  allergy: "無し", 
  admin: false, 
  user_id: user1.id,
)

user2 =  User.create(
  login_name: "user2",
  password: 'password',
  admin: false
)

Account.create(
  name: "ユーザー2", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open("./public/images/user2.jpg"),
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.cell_phone, 
  allergy: "無し", 
  admin: false, 
  user_id: user2.id,
)

user3 =  User.create(
  login_name: "user3",
  password: 'password',
  admin: false
)

Account.create(
  name: "ユーザー3", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open("./public/images/user3.jpg"),
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.cell_phone, 
  allergy: "無し", 
  admin: false, 
  user_id: user3.id,
)

admin_user =  User.create(
  login_name: "admin_user",
  password: 'password',
  admin: true
)

Account.create(
  name: "ユーザー3", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open("./public/images/admin_user.jpg"),
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.cell_phone, 
  allergy: "無し", 
  admin: true, 
  user: admin_user
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

hospital1 = Hospital.create(
  name: "hospital1", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber, 
  medical_history_id: medical_history1.id
)

Hospital.create(
  name: "hospital2", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber, 
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
  name: "hospital1", 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber, 
  medical_history_id: medical_history3.id
)

medical_history4 = MedicalHistory.create(
  name: '脳梗塞', 
  start_on: DateTime.now - 1_000, 
  surgery: '', 
  surgery_on: '', 
  user_id: user3.id
)

5.times do |n|
MedicationHistory.create(
    name: "medication#{n}", 
    usage: '内服', 
    prescription_on: DateTime.now - 10, 
    note: '', 
    user_id: user1.id
)
end
5.times do |n|
MedicationHistory.create(
    name: "medication#{n}", 
    usage: '内服', 
    prescription_on: DateTime.now - 10, 
    note: '', 
    user_id: user2.id
  )
end

5.times do |n|
MedicationHistory.create(
    name: "medication#{n}", 
    usage: '内服', 
    prescription_on: DateTime.now - 10, 
    note: '', 
    user_id: user3.id
  )
end
5.times do |n|
MedicationHistory.create(
    name: "medication#{n}", 
    usage: '内服', 
    prescription_on: DateTime.now - 10, 
    note: '', 
    user_id: admin_user.id
  )
end
