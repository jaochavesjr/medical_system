class Doctor < ApplicationRecord
  before_save { self.crm_uf = crm_uf.upcase }
  has_many :appointments
  has_many :patients, through: :appointments

  validates :name, presence: true
  validates :crm, presence: true
  validates :crm_uf, presence: true
  validates :crm, uniqueness: { scope: :crm_uf, case_sensitive: true }

  def no_patient?
    if patients.count > 0
      errors.add :doctor, "has linked patients"
      false
    else
      true
    end
  end
end
