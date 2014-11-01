require 'test_helper'

class KundensControllerTest < ActionController::TestCase
  setup do
    @kunden = kundens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kundens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kunden" do
    assert_difference('Kunden.count') do
      post :create, kunden: { name: @kunden.name, photo: @kunden.photo, photo_gray: @kunden.photo_gray, url: @kunden.url }
    end

    assert_redirected_to kunden_path(assigns(:kunden))
  end

  test "should show kunden" do
    get :show, id: @kunden
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kunden
    assert_response :success
  end

  test "should update kunden" do
    patch :update, id: @kunden, kunden: { name: @kunden.name, photo: @kunden.photo, photo_gray: @kunden.photo_gray, url: @kunden.url }
    assert_redirected_to kunden_path(assigns(:kunden))
  end

  test "should destroy kunden" do
    assert_difference('Kunden.count', -1) do
      delete :destroy, id: @kunden
    end

    assert_redirected_to kundens_path
  end
end
