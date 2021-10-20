# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(
  login_name: "ユーザー",
  password: 'password',
  admin: false
)

Account.create(
  name: "ユーザー1", 
  birth_date: DateTime.now - 10_000, 
  icon:File.open(".public/images/user1.jpg"),
  mail: "user1@ex.com", 
  address: "", 
  tel: "", 
  allergy: "無し", 
  admin: false, 
  user_id: 1,
)

user2 =  User.create(
  login_name: "user2",
  password: 'password',
  admin: false
)

user2 =  User.create(
  login_name: "user3",
  password: 'password',
  admin: false
)

admin_user =  User.create(
  login_name: "admin_user",
  password: 'password',
  admin: true
)

