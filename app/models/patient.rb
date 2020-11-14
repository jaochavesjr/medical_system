class Patient < ApplicationRecord
  has_many :doctor, dependent: :destroy

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: { case_sensitive: false }
end
