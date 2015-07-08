require 'test_helper'

class SgPostcodeTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, SgPostcode
  end

  test "init new sg postcode Array" do
    postcode_array = SgPostcode::Array.new([])
    assert_kind_of SgPostcode::Array, postcode_array
  end
end
