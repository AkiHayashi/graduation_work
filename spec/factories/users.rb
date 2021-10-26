FactoryBot.define do
  factory :user do
    login_name { 'テストユーザー' }
    password { '111111' }
    admin { false }
  end
end