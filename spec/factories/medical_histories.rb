FactoryBot.define do
  factory :medical_history do
    name { 'disease1' }
    start_on { DateTime.now - 1 }
    surgery { 'surgery1' }
    surgery_on { DateTime.now + 1 }
  end
end