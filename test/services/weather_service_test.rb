require "test_helper"

class WeatherServiceTest < ActiveSupport::TestCase
    test "Service responds to known address" do
        post_code = "43224"
        data = WeatherService.call(post_code)
        assert_equal "43224, USA", data["resolvedAddress"]
    end
end