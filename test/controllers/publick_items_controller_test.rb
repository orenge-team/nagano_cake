require 'test_helper'

class PublickItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publick_items_index_url
    assert_response :success
  end

  test "should get show" do
    get publick_items_show_url
    assert_response :success
  end

end
