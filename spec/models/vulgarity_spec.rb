require 'spec_helper'

describe Vulgarity do
  it { should validate_presence_of :text }
  it { should validate_uniqueness_of :text }

  describe '.random' do
    let(:vulgarities) { [FactoryGirl.create(:vulgarity), FactoryGirl.create(:vulgarity)] }

    it 'returns a vulgarity' do
      vulgarities.should include described_class.random
    end
  end
end
