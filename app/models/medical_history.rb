class MedicalHistory < ApplicationRecord
  belongs_to :user
  has_many :hospitals, inverse_of: :medical_history, dependent: :destroy
  accepts_nested_attributes_for :hospitals, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :start_on
  end

end
