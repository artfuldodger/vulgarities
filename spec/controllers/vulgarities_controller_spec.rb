require 'spec_helper'

describe VulgaritiesController do
  describe 'a GET to :index' do
    it 'assigns a random vulgarity to @vulgarity' do
      vulgarity = mock
      Vulgarity.stub(random: vulgarity)
      get :index
      assigns(:vulgarity).should == vulgarity
    end

    it 'will give you json if you ask' do
      vulgarity = stub(as_json: { stuff: 'things' } )
      Vulgarity.stub(random: vulgarity)
      get :index, format: :json
      response.body.should == '{"stuff":"things"}'
    end

    it 'will give you xml if you ask' do
      vulgarity = FactoryGirl.create(:vulgarity)
      Vulgarity.stub(random: vulgarity)
      get :index, format: :xml
      response.body.should include "<text>#{vulgarity.text}</text>"
    end
  end
end