class HomesController < ApplicationController
  def index
    postcode = params[:postcode].split(',')

    @result = SgPostcode::Array.new(postcode).convert
  end
end
