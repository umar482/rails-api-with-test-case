RSpec.describe Reservation, type: :model do
 # Association test
 it { should belong_to(:vehicle) }
 it { should belong_to(:customer) }
 # Validation tests
 it { should validate_presence_of(:date) }
 it { should validate_presence_of(:time) }

end

