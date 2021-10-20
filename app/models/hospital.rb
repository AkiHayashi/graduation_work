class Hospital < ApplicationRecord
  belongs_to :medical_history

  validates :name, presence: true, length: { maximum: 50 }
end
