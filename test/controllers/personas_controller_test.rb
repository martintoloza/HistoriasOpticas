require 'test_helper'

class PersonasControllerTest < ActionController::TestCase
  setup do
    @persona = personas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:personas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create persona" do
    assert_difference('Persona.count') do
      post :create, persona: { barrio_id: @persona.barrio_id, ciudad_id: @persona.ciudad_id, direccion: @persona.direccion, edad: @persona.edad, email: @persona.email, est_civil: @persona.est_civil, estado: @persona.estado, fechanac: @persona.fechanac, nroiden: @persona.nroiden, pri_ape: @persona.pri_ape, pri_nom: @persona.pri_nom, profesion_id: @persona.profesion_id, seg_ape: @persona.seg_ape, seg_nom: @persona.seg_nom, sexo: @persona.sexo, tipoafili: @persona.tipoafili, tipoiden: @persona.tipoiden, tipousua: @persona.tipousua, uniedad: @persona.uniedad, zonaresi: @persona.zonaresi }
    end

    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should show persona" do
    get :show, id: @persona
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @persona
    assert_response :success
  end

  test "should update persona" do
    patch :update, id: @persona, persona: { barrio_id: @persona.barrio_id, ciudad_id: @persona.ciudad_id, direccion: @persona.direccion, edad: @persona.edad, email: @persona.email, est_civil: @persona.est_civil, estado: @persona.estado, fechanac: @persona.fechanac, nroiden: @persona.nroiden, pri_ape: @persona.pri_ape, pri_nom: @persona.pri_nom, profesion_id: @persona.profesion_id, seg_ape: @persona.seg_ape, seg_nom: @persona.seg_nom, sexo: @persona.sexo, tipoafili: @persona.tipoafili, tipoiden: @persona.tipoiden, tipousua: @persona.tipousua, uniedad: @persona.uniedad, zonaresi: @persona.zonaresi }
    assert_redirected_to persona_path(assigns(:persona))
  end

  test "should destroy persona" do
    assert_difference('Persona.count', -1) do
      delete :destroy, id: @persona
    end

    assert_redirected_to personas_path
  end
end
