# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Gear, type: :model do
  describe 'validations' do
    context 'gear offset value' do
      subject { build :gear }
      it { is_expected.to validate_presence_of(:offset_value) }
      it { should validate_numericality_of(:offset_value) }
    end
  end

  context 'factory' do
    it 'has a valid factory' do
      gear = create(:gear)

      expect(gear.valid?).to eq(true)
    end
  end
end
