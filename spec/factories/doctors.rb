FactoryBot.define do
  factory :doctor do
    name { Faker::Name.name }
    crm {Faker::Code.sin}
    crm_uf { %i("SP" "RJ" "CE" "BA").sample }
  end
end
