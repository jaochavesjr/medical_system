class Patient < ApplicationRecord

  validates :name, presence: true
  validates :birth_date, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :cpf, :cpf => true
end
