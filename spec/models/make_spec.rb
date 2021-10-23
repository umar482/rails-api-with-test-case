RSpec.describe Make, type: :model do
   # Association test
   it { should have_many(:vehicles) }
    # Validation tests
   it { should validate_presence_of(:name) }
end
