require 'test_helper'

class DevelopersControllerTest < ActionController::TestCase
  setup do
    @developer = developers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:developers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create developer" do
    assert_difference('Developer.count') do
      post :create, developer: { address: @developer.address, email: @developer.email, last_name: @developer.last_name, name: @developer.name, phone: @developer.phone, scholarship: @developer.scholarship, why_hack: @developer.why_hack, why_scholarship: @developer.why_scholarship }
    end

    assert_redirected_to developer_path(assigns(:developer))
  end

  test "should show developer" do
    get :show, id: @developer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @developer
    assert_response :success
  end

  test "should update developer" do
    patch :update, id: @developer, developer: { address: @developer.address, email: @developer.email, last_name: @developer.last_name, name: @developer.name, phone: @developer.phone, scholarship: @developer.scholarship, why_hack: @developer.why_hack, why_scholarship: @developer.why_scholarship }
    assert_redirected_to developer_path(assigns(:developer))
  end

  test "should destroy developer" do
    assert_difference('Developer.count', -1) do
      delete :destroy, id: @developer
    end

    assert_redirected_to developers_path
  end
end
