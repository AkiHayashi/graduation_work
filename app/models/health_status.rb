class HealthStatus < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :systolic
    validates :diastolic
    validates :pulse
  end
  
end
