require "application_system_test_case"

class UserModelsTest < ApplicationSystemTestCase
  setup do
    @user_model = user_models(:one)
  end

  test "visiting the index" do
    visit user_models_url
    assert_selector "h1", text: "User Models"
  end

  test "creating a User model" do
    visit user_models_url
    click_on "New User Model"

    fill_in "Apellidousuario", with: @user_model.apellidousuario
    fill_in "Correousuario", with: @user_model.correousuario
    fill_in "Nombreusuario", with: @user_model.nombreusuario
    fill_in "Usuario", with: @user_model.usuario
    click_on "Create User model"

    assert_text "User model was successfully created"
    click_on "Back"
  end

  test "updating a User model" do
    visit user_models_url
    click_on "Edit", match: :first

    fill_in "Apellidousuario", with: @user_model.apellidousuario
    fill_in "Correousuario", with: @user_model.correousuario
    fill_in "Nombreusuario", with: @user_model.nombreusuario
    fill_in "Usuario", with: @user_model.usuario
    click_on "Update User model"

    assert_text "User model was successfully updated"
    click_on "Back"
  end

  test "destroying a User model" do
    visit user_models_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User model was successfully destroyed"
  end
end
