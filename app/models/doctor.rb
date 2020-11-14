class Doctor < ApplicationRecord
  has_many :appointments, dependent: :nullify

  validates :name, presence: true
  validates :crm, presence: true, uniqueness: { case_sensitive: false }
  validates :crm_uf, presence: true, uniqueness: true
end
