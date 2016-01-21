require 'spec_helper'

describe CiudadesController do

  it 'responds to GET :index' do
    get :index
    assert_response(:success)
  end

  it 'assigns @ciudades' do
    get :index
    assigns(:ciudades).must_equal([])
  end

  it 'assigns @filterrific' do
    get :index
    assigns(:filterrific).must_be_instance_of(Filterrific::ParamSet)
  end

end
