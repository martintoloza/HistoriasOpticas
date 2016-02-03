class PersonasController < ApplicationController
  before_action :set_persona, only: [:show, :edit, :update, :destroy]

  def index
    @fpersona = initialize_filterrific(
      Persona,
      params[:filterrific],
      :select_options => {
        sorted_by: Persona.options_for_sorted_by
      }
    ) or return
    @personas = @fpersona.find.page(params[:page])
    # @personas = Persona.all
    #    with_estado_id: Departamento.options_for_select

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def new
    @persona = Persona.new
  end

  def edit
  end

  def create
    @persona = Persona.new(persona_params)

    respond_to do |format|
      if @persona.save
        format.html { redirect_to @persona, notice: 'Persona fue creada con éxito.' }
        format.json { render :show, status: :created, location: @persona }
      else
        format.html { render :new }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @persona.update(persona_params)
        format.html { redirect_to @persona, notice: 'Persona fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @persona }
      else
        format.html { render :edit }
        format.json { render json: @persona.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @persona.destroy
    respond_to do |format|
      format.html { redirect_to personas_url, notice: 'Persona fue borrada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_persona
      @persona = Persona.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def persona_params
      params.require(:persona).permit(:tipoiden, :nroiden, :pri_ape, :seg_ape, :pri_nom, :seg_nom, :sexo, :fechanac, :uniedad, :edad, :zonaresi, :direccion, :email, :tipousua, :tipoafili, :est_civil, :estado, :ciudad_id, :barrio_id, :profesion_id)
    end
end
