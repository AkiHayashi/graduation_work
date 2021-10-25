class MedicalHistory < ApplicationRecord
  belongs_to :user
  has_many :hospitals, inverse_of: :medical_history, dependent: :destroy
  accepts_nested_attributes_for :hospitals, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :start_on
  end

  validate :date_before_today
  
  def date_before_today
    return if start_on.blank?
    errors.add(:start_on, "は今日以前のものを選択してください") if start_on > Date.today
  end

end
