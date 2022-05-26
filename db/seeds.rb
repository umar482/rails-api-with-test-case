# frozen_string_literal: true

# creating random gear devices
names = %w[galaxy_watch apple_watch mi_band]

names.each do |name|
  Gear.create(name: name, offset_value: 1.2)
end

# creating user
User.create(name: 'umar', gear_id: 1)
