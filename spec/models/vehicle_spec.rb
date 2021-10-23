RSpec.describe Vehicle, type: :model do
   # Association test
   it { should have_many(:reservations) }
   it { should belong_to(:make) }
    # Validation tests
   it { should validate_presence_of(:model) }
end
