require 'test_helper'

class PlayerOwnershipsControllerTest < ActionController::TestCase
  setup do
    @player_ownership = player_ownerships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:player_ownerships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create player_ownership" do
    assert_difference('PlayerOwnership.count') do
      post :create, player_ownership: @player_ownership.attributes
    end

    assert_redirected_to player_ownership_path(assigns(:player_ownership))
  end

  test "should show player_ownership" do
    get :show, id: @player_ownership.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @player_ownership.to_param
    assert_response :success
  end

  test "should update player_ownership" do
    put :update, id: @player_ownership.to_param, player_ownership: @player_ownership.attributes
    assert_redirected_to player_ownership_path(assigns(:player_ownership))
  end

  test "should destroy player_ownership" do
    assert_difference('PlayerOwnership.count', -1) do
      delete :destroy, id: @player_ownership.to_param
    end

    assert_redirected_to player_ownerships_path
  end
end
