class VulgaritiesController < ApplicationController
  def index
    @vulgarity = Vulgarity.random
  end
end