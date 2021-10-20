class MedicationHistory < ApplicationRecord
  belongs_to :user
  has_many :pharmacies, inverse_of: :medication_history, dependent: :destroy
  accepts_nested_attributes_for :pharmacies, reject_if: :all_blank, allow_destroy: true
  enum usage: { 内服: 0, 頓服: 1, 外用: 2, その他: 3 }

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :usage
    validates :prescription_on
  end
  
end
