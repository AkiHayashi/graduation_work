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
  user_id: 1,
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
  user_id: 2,
)

user3 =  User.create(
  login_name: "user3",
  password: 'password',
  admin: false
)

Account.create(
  name: "ユーザー3", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open("./public/images/user1.jpg"),
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.cell_phone, 
  allergy: "無し", 
  admin: false, 
  user_id: 3,
)

admin_user =  User.create(
  login_name: "admin_user",
  password: 'password',
  admin: true
)

Account.create(
  name: "ユーザー3", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open("./public/images/user1.jpg"),
  mail: Faker::Internet.email, 
  address: Faker::Address.city, 
  tel: Faker::PhoneNumber.cell_phone, 
  allergy: "無し", 
  admin: true, 
  user: admin_user,
)

