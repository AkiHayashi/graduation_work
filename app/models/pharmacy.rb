class Pharmacy < ApplicationRecord
  belongs_to :medication_history
  validates :name, presence: true, length: { maximum: 50 }
end
