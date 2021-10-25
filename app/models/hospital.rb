class Hospital < ApplicationRecord
  belongs_to :medical_history

  validates :name, presence: true, length: { maximum: 50 }
  validates :tel, length: { maximum: 11 },format: { with: /\A[0-9０-９]+\z/}
end
