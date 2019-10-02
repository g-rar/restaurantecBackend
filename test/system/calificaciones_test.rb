require "application_system_test_case"

class CalificacionesTest < ApplicationSystemTestCase
  setup do
    @calificacione = calificaciones(:one)
  end

  test "visiting the index" do
    visit calificaciones_url
    assert_selector "h1", text: "Calificaciones"
  end

  test "creating a Calificacione" do
    visit calificaciones_url
    click_on "New Calificacione"

    fill_in "Calificacion", with: @calificacione.calificacion
    fill_in "Correousuario", with: @calificacione.correousuario
    fill_in "Restaurante", with: @calificacione.restaurante
    click_on "Create Calificacione"

    assert_text "Calificacione was successfully created"
    click_on "Back"
  end

  test "updating a Calificacione" do
    visit calificaciones_url
    click_on "Edit", match: :first

    fill_in "Calificacion", with: @calificacione.calificacion
    fill_in "Correousuario", with: @calificacione.correousuario
    fill_in "Restaurante", with: @calificacione.restaurante
    click_on "Update Calificacione"

    assert_text "Calificacione was successfully updated"
    click_on "Back"
  end

  test "destroying a Calificacione" do
    visit calificaciones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calificacione was successfully destroyed"
  end
end
