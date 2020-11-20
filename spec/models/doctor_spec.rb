require 'rails_helper'

RSpec.describe Doctor, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:crm) }
  it { is_expected.to validate_presence_of(:crm_uf) }
  it { is_expected.to have_many(:patients).through(:appointments) }
  #it { is_expected.to validate_uniqueness_of(:crm).scoped_to(:crm_uf)}

end
