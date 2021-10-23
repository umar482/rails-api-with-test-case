FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password {112233 }
  end

  factory :make do
    name { Faker::Vehicle.manufacture}
    after(:create) do |make, name|
      create(:vehicle, model:  Faker::Vehicle.model, make_id: make.id )
    end
  end

  factory :vehicle do
    model { Faker::Vehicle.model}
    association :make
  end
end
