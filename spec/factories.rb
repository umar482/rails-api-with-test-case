FactoryBot.define do
  factory :temperature_reading do
    user { nil }
    body_temp { 1.5 }
    actual_temp { 1.5 }
  end

  factory :user do
    name { "MyString" }
    gear { nil }
  end

  factory :gear do
    name { "MyString" }
    offset_value { 1.5 }
  end

  
end
