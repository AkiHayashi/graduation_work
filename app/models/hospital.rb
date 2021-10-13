class Hospital < ApplicationRecord
  belongs_to :medical_history
  belongs_to :user
end
