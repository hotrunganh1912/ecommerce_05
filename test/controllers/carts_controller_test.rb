require "test_helper"
test "should get show" do
  get carts_show_url
  assert_response :success
end
