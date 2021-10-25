class HealthStatus < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :systolic, numericality: {only_integer: true, greater_than_or_equal_to: 50}
    validates :diastolic, numericality: {only_integer: true, greater_than_or_equal_to: 50}
    validates :pulse, numericality: {only_integer: true, greater_than_or_equal_to: 50}
  end
  
end
