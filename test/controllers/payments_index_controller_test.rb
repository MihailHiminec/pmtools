require 'test_helper'

class PaymentsIndexControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get payments_index_index_url
    assert_response :success
  end

end
