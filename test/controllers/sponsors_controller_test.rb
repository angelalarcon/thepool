require 'test_helper'

class SponsorsControllerTest < ActionController::TestCase
  setup do
    @sponsor = sponsors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sponsors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sponsor" do
    assert_difference('Sponsor.count') do
      post :create, sponsor: { active: @sponsor.active, company_email: @sponsor.company_email, company_name: @sponsor.company_name, company_phone: @sponsor.company_phone, last_name: @sponsor.last_name, name: @sponsor.name, email: @sponsor.email, phone: @sponsor.phone }
    end

    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should show sponsor" do
    get :show, id: @sponsor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sponsor
    assert_response :success
  end

  test "should update sponsor" do
    patch :update, id: @sponsor, sponsor: { active: @sponsor.active, company_email: @sponsor.company_email, company_name: @sponsor.company_name, company_phone: @sponsor.company_phone, last_name: @sponsor.last_name, name: @sponsor.name, email: @sponsor.email, phone: @sponsor.phone }
    assert_redirected_to sponsor_path(assigns(:sponsor))
  end

  test "should destroy sponsor" do
    assert_difference('Sponsor.count', -1) do
      delete :destroy, id: @sponsor
    end

    assert_redirected_to sponsors_path
  end
end
