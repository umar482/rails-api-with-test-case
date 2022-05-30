# frozen_string_literal: true

# creating random gear devices
names = %w[galaxy_watch apple_watch mi_band]

names.each do |name|
  Gear.create(name: name, offset_value: 1.2)
end

# creating user
User.create(name: 'umar', gear_id: 1)

# temperature readings for the user
body_temp = [35, 36, 36, 37.5, 37.5, 37.5]
body_temp.each do |bt|
  TemperatureReading.create(body_temp: bt, user_id: 1)
end
