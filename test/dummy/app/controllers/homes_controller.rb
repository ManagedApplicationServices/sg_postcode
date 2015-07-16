class HomesController < ApplicationController
  def index
    postcode = params[:postcode].try :split, ','
    result = SgPostcode::Array.new(postcode || []).convert

    @result = result.delete_if { |item| item[:format_address].nil? }
  end
end
