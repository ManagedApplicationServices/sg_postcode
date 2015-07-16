class HomesController < ApplicationController
  def index
    postcode = params[:postcode]

    @result = SgPostcode::Array.new([postcode]).convert
  end
end
