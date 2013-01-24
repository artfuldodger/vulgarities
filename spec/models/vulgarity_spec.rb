require 'spec_helper'

describe Vulgarity do
  it { should validate_presence_of :text }
  it { should validate_uniqueness_of :text }

  describe '.random' do
    let(:vulgarities) { [FactoryGirl.create(:vulgarity), FactoryGirl.create(:vulgarity)] }

    it 'returns a vulgarity' do
      vulgarities.should include described_class.random
    end

    it 'returns vulgarity with requested initial letter' do
      matching_vulgarity = FactoryGirl.create(:vulgarity, text: 'Zebra')
      nonmatching_vulgarity = FactoryGirl.create(:vulgarity, text: 'Aardvark')
      described_class.random(letter: 'z').should == matching_vulgarity
    end

    it 'returns an existing vulgarity if no matching by letter' do
      some_vulgarity = FactoryGirl.create(:vulgarity)
      described_class.random(letter: '!').should == some_vulgarity
    end
  end
end
