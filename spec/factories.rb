# frozen_string_literal: true

FactoryBot.define do
  factory :temperature_reading do
    user { User.first }
    body_temp { 1.5 }
    actual_temp { 1.5 }
  end

  factory :user do
    name { 'MyString' }
    gear { Gear.first }
  end

  factory :gear do
    name { 'MyString' }
    offset_value { 1.5 }
  end
end
