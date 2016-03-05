require 'test_helper'

class PromotionsControllerTest < ActionController::TestCase
  setup do
    @promotion = promotions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotion" do
    assert_difference('Promotion.count') do
      post :create, promotion: { affiliate: @promotion.affiliate, begin_at: @promotion.begin_at, description: @promotion.description, discount: @promotion.discount, enabled: @promotion.enabled, end_at: @promotion.end_at, external_id: @promotion.external_id, image_url: @promotion.image_url, name: @promotion.name, price_billet: @promotion.price_billet, price_from: @promotion.price_from, price_to: @promotion.price_to, url: @promotion.url }
    end

    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should show promotion" do
    get :show, id: @promotion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promotion
    assert_response :success
  end

  test "should update promotion" do
    patch :update, id: @promotion, promotion: { affiliate: @promotion.affiliate, begin_at: @promotion.begin_at, description: @promotion.description, discount: @promotion.discount, enabled: @promotion.enabled, end_at: @promotion.end_at, external_id: @promotion.external_id, image_url: @promotion.image_url, name: @promotion.name, price_billet: @promotion.price_billet, price_from: @promotion.price_from, price_to: @promotion.price_to, url: @promotion.url }
    assert_redirected_to promotion_path(assigns(:promotion))
  end

  test "should destroy promotion" do
    assert_difference('Promotion.count', -1) do
      delete :destroy, id: @promotion
    end

    assert_redirected_to promotions_path
  end
end
