require 'test_helper'

class SiteReferencesControllerTest < ActionController::TestCase
  setup do
    @site_reference = site_references(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_references)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_reference" do
    assert_difference('SiteReference.count') do
      post :create, :site_reference => @site_reference.attributes
    end

    assert_redirected_to site_reference_path(assigns(:site_reference))
  end

  test "should show site_reference" do
    get :show, :id => @site_reference.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @site_reference.to_param
    assert_response :success
  end

  test "should update site_reference" do
    put :update, :id => @site_reference.to_param, :site_reference => @site_reference.attributes
    assert_redirected_to site_reference_path(assigns(:site_reference))
  end

  test "should destroy site_reference" do
    assert_difference('SiteReference.count', -1) do
      delete :destroy, :id => @site_reference.to_param
    end

    assert_redirected_to site_references_path
  end
end
