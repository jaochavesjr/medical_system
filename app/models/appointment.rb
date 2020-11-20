class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor

  validates :starts_at, presence: true
  validates :ends_at, presence: true
  validates_with AppointmentIntervalValidator
  validates_with CheckTimetableValidator
end
