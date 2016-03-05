require 'test_helper'

class CouponsControllerTest < ActionController::TestCase
  setup do
    @coupon = coupons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coupons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coupon" do
    assert_difference('Coupon.count') do
      post :create, coupon: { affiliate: @coupon.affiliate, begin_at: @coupon.begin_at, code: @coupon.code, description: @coupon.description, enabled: @coupon.enabled, end_at: @coupon.end_at, name: @coupon.name, rules_url: @coupon.rules_url, store: @coupon.store, url: @coupon.url, user: @coupon.user }
    end

    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should show coupon" do
    get :show, id: @coupon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coupon
    assert_response :success
  end

  test "should update coupon" do
    patch :update, id: @coupon, coupon: { affiliate: @coupon.affiliate, begin_at: @coupon.begin_at, code: @coupon.code, description: @coupon.description, enabled: @coupon.enabled, end_at: @coupon.end_at, name: @coupon.name, rules_url: @coupon.rules_url, store: @coupon.store, url: @coupon.url, user: @coupon.user }
    assert_redirected_to coupon_path(assigns(:coupon))
  end

  test "should destroy coupon" do
    assert_difference('Coupon.count', -1) do
      delete :destroy, id: @coupon
    end

    assert_redirected_to coupons_path
  end
end
