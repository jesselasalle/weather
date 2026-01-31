require "test_helper"

class GeocodeServiceTest < ActiveSupport::TestCase
    test "Service responds to known address" do
        # Cleveland Browns Stadium 
        address = "100 Alfred Lerner Way, Cleveland, Ohio"
        data = GeocodeService.call(address)
        assert_equal "us", data[:country_code]
        assert_equal "44113", data[:post_code]
    end
end