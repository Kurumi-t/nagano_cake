require "test_helper"

class Public::CartItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_cart_items_index_url
    assert_response :success
  end

  test "should get update" do
    get public_cart_items_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_cart_items_destroy_url
    assert_response :success
  end

  test "should get destoy_all" do
    get public_cart_items_destoy_all_url
    assert_response :success
  end

  test "should get edit" do
    get public_cart_items_edit_url
    assert_response :success
  end
end
