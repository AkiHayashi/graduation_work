FactoryBot.define do
  factory :medication_history do
    name { 'medication1' }
    usage { 0 }
    prescription_on { DateTime.now }
    note { 'ใในใ' }
  end
end