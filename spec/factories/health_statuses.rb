FactoryBot.define do
  factory :health_status do
    systolic { 100 }
    diastolic { 100 }
    pulse { 85 }
    condition { 'テスト' }
  end
end