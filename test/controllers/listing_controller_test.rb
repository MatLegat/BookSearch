require 'test_helper'

class ListingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get list_index_url
    assert_response :success
  end

end
