require "test_helper"

class Admin::MoviesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_movies_index_url
    assert_response :success
  end
end
