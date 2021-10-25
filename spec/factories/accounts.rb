FactoryBot.define do
  factory :account do
    name { '健康花子' }
    birth_date { DateTime.now - 10_000 }
    mail { 'test_user@test.com'}
    address { '東京都墨田区押上' }
    tel { '09011111111' }
    allergy { 0 }
    admin { false }
  end
end