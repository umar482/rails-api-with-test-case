
RSpec.describe Customer, type: :model do
   # Association test
   it { should have_many(:reservations) }
    # Validation tests
   it { should validate_presence_of(:email) }
end
