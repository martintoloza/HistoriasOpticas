class ProfesionesController < ApplicationController
  before_action :set_profesion, only: [:show, :edit, :update, :destroy]

  def index
    @fprofesion = initialize_filterrific(
      Profesion,
      params[:filterrific]
    ) or return
    @profesiones = @fprofesion.find.page(params[:page])

    # Respond to html for initial page load and to js for AJAX filter updates.
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def new
    @profesion = Profesion.new
  end

  def edit
  end

  def create
    @profesion = Profesion.new(profesion_params)

    respond_to do |format|
      if @profesion.save
        format.html { redirect_to @profesion, notice: 'Profesion fue creada con éxito.' }
        format.json { render :show, status: :created, location: @profesion }
      else
        format.html { render :new }
        format.json { render json: @profesion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profesion.update(profesion_params)
        format.html { redirect_to @profesion, notice: 'Profesion fue actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @profesion }
      else
        format.html { render :edit }
        format.json { render json: @profesion.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profesion.destroy
    respond_to do |format|
      format.html { redirect_to profesiones_url, notice: 'Profesion fue borrada con éxito.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profesion
      @profesion = Profesion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profesion_params
      params.require(:profesion).permit(:codigo, :nombre)
    end
end
