require 'test_helper'

class ProfesionesControllerTest < ActionController::TestCase
  setup do
    @profesion = profesiones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profesiones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profesion" do
    assert_difference('Profesion.count') do
      post :create, profesion: { codigo: @profesion.codigo, nombre: @profesion.nombre }
    end

    assert_redirected_to profesion_path(assigns(:profesion))
  end

  test "should show profesion" do
    get :show, id: @profesion
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profesion
    assert_response :success
  end

  test "should update profesion" do
    patch :update, id: @profesion, profesion: { codigo: @profesion.codigo, nombre: @profesion.nombre }
    assert_redirected_to profesion_path(assigns(:profesion))
  end

  test "should destroy profesion" do
    assert_difference('Profesion.count', -1) do
      delete :destroy, id: @profesion
    end

    assert_redirected_to profesiones_path
  end
end
