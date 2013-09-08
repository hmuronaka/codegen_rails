require 'test_helper'

class GeneratorInfosControllerTest < ActionController::TestCase
  setup do
    @generator_info = generator_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:generator_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create generator_info" do
    assert_difference('GeneratorInfo.count') do
      post :create, generator_info: { description: @generator_info.description, from: @generator_info.from, name: @generator_info.name, to: @generator_info.to }
    end

    assert_redirected_to generator_info_path(assigns(:generator_info))
  end

  test "should show generator_info" do
    get :show, id: @generator_info
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @generator_info
    assert_response :success
  end

  test "should update generator_info" do
    put :update, id: @generator_info, generator_info: { description: @generator_info.description, from: @generator_info.from, name: @generator_info.name, to: @generator_info.to }
    assert_redirected_to generator_info_path(assigns(:generator_info))
  end

  test "should destroy generator_info" do
    assert_difference('GeneratorInfo.count', -1) do
      delete :destroy, id: @generator_info
    end

    assert_redirected_to generator_infos_path
  end
end
