class Doctor < ApplicationRecord
  before_save { self.crm_uf = crm_uf.upcase }
  has_many :appointments, dependent: :nullify

  validates :name, presence: true
  validates :crm, presence: true
  validates :crm_uf, presence: true
end
