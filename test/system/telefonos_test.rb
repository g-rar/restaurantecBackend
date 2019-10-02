require "application_system_test_case"

class TelefonosTest < ApplicationSystemTestCase
  setup do
    @telefono = telefonos(:one)
  end

  test "visiting the index" do
    visit telefonos_url
    assert_selector "h1", text: "Telefonos"
  end

  test "creating a Telefono" do
    visit telefonos_url
    click_on "New Telefono"

    fill_in "Numtelefono", with: @telefono.numtelefono
    fill_in "Restaurante", with: @telefono.restaurante
    fill_in "Tipotel", with: @telefono.tipotel
    click_on "Create Telefono"

    assert_text "Telefono was successfully created"
    click_on "Back"
  end

  test "updating a Telefono" do
    visit telefonos_url
    click_on "Edit", match: :first

    fill_in "Numtelefono", with: @telefono.numtelefono
    fill_in "Restaurante", with: @telefono.restaurante
    fill_in "Tipotel", with: @telefono.tipotel
    click_on "Update Telefono"

    assert_text "Telefono was successfully updated"
    click_on "Back"
  end

  test "destroying a Telefono" do
    visit telefonos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Telefono was successfully destroyed"
  end
end
