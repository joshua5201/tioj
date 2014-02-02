require 'test_helper'

class TestdataControllerTest < ActionController::TestCase
  setup do
    @testdatum = testdata(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:testdata)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create testdatum" do
    assert_difference('Testdatum.count') do
      post :create, testdatum: { answer: @testdatum.answer, input: @testdatum.input }
    end

    assert_redirected_to testdatum_path(assigns(:testdatum))
  end

  test "should show testdatum" do
    get :show, id: @testdatum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @testdatum
    assert_response :success
  end

  test "should update testdatum" do
    patch :update, id: @testdatum, testdatum: { answer: @testdatum.answer, input: @testdatum.input }
    assert_redirected_to testdatum_path(assigns(:testdatum))
  end

  test "should destroy testdatum" do
    assert_difference('Testdatum.count', -1) do
      delete :destroy, id: @testdatum
    end

    assert_redirected_to testdata_path
  end
end
