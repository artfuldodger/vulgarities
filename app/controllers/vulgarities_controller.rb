class VulgaritiesController < ApplicationController
  def index
    @vulgarity = Vulgarity.random

    respond_to do |format|
      format.html
      format.json { render json: @vulgarity }
      format.xml  { render xml: @vulgarity }
    end
  end
end