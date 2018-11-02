FactoryBot.define do
  factory :basic_health_unit do
    name { "MyString" }
    address { "MyString" }
    city { "MyString" }
    phone { "MyString" }
    lat { 1.5 }
    long { 1.5 }
    size { 1 }
    adaptation_for_seniors { 1 }
    medical_equipment { 1 }
    medicine { 1 }
  end
end
