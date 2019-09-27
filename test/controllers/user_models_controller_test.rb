require 'test_helper'

class UserModelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_model = user_models(:one)
  end

  test "should get index" do
    get user_models_url
    assert_response :success
  end

  test "should get new" do
    get new_user_model_url
    assert_response :success
  end

  test "should create user_model" do
    assert_difference('UserModel.count') do
      post user_models_url, params: { user_model: { apellidousuario: @user_model.apellidousuario, correousuario: @user_model.correousuario, nombreusuario: @user_model.nombreusuario, usuario: @user_model.usuario } }
    end

    assert_redirected_to user_model_url(UserModel.last)
  end

  test "should show user_model" do
    get user_model_url(@user_model)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_model_url(@user_model)
    assert_response :success
  end

  test "should update user_model" do
    patch user_model_url(@user_model), params: { user_model: { apellidousuario: @user_model.apellidousuario, correousuario: @user_model.correousuario, nombreusuario: @user_model.nombreusuario, usuario: @user_model.usuario } }
    assert_redirected_to user_model_url(@user_model)
  end

  test "should destroy user_model" do
    assert_difference('UserModel.count', -1) do
      delete user_model_url(@user_model)
    end

    assert_redirected_to user_models_url
  end
end
