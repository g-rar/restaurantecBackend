require 'test_helper'

class CalificacionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @calificacione = calificaciones(:one)
  end

  test "should get index" do
    get calificaciones_url
    assert_response :success
  end

  test "should get new" do
    get new_calificacione_url
    assert_response :success
  end

  test "should create calificacione" do
    assert_difference('Calificacione.count') do
      post calificaciones_url, params: { calificacione: { calificacion: @calificacione.calificacion, correousuario: @calificacione.correousuario, restaurante: @calificacione.restaurante } }
    end

    assert_redirected_to calificacione_url(Calificacione.last)
  end

  test "should show calificacione" do
    get calificacione_url(@calificacione)
    assert_response :success
  end

  test "should get edit" do
    get edit_calificacione_url(@calificacione)
    assert_response :success
  end

  test "should update calificacione" do
    patch calificacione_url(@calificacione), params: { calificacione: { calificacion: @calificacione.calificacion, correousuario: @calificacione.correousuario, restaurante: @calificacione.restaurante } }
    assert_redirected_to calificacione_url(@calificacione)
  end

  test "should destroy calificacione" do
    assert_difference('Calificacione.count', -1) do
      delete calificacione_url(@calificacione)
    end

    assert_redirected_to calificaciones_url
  end
end
