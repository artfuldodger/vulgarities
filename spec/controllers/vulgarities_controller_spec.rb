require 'spec_helper'

describe VulgaritiesController do
  describe 'a GET to :index' do
    it 'assigns a random vulgarity to @vulgarity' do
      vulgarity = mock
      Vulgarity.stub(random: vulgarity)
      get :index
      assigns(:vulgarity).should == vulgarity
    end
  end
end