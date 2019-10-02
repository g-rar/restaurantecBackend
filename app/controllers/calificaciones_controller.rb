class CalificacionesController < ApplicationController
  before_action :set_calificacione, only: [:show, :edit, :update, :destroy]

  # GET /calificaciones
  # GET /calificaciones.json
  def index
    @calificaciones = Calificacione.all
  end

  # GET /calificaciones/1
  # GET /calificaciones/1.json
  def show
  end

  # GET /calificaciones/new
  def new
    @calificacione = Calificacione.new
  end

  # GET /calificaciones/1/edit
  def edit
  end

  # POST /calificaciones
  # POST /calificaciones.json
  def create
    @calificacione = Calificacione.new(calificacione_params)

    respond_to do |format|
      if @calificacione.save
        format.html { redirect_to @calificacione, notice: 'Calificacione was successfully created.' }
        format.json { render :show, status: :created, location: @calificacione }
      else
        format.html { render :new }
        format.json { render json: @calificacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calificaciones/1
  # PATCH/PUT /calificaciones/1.json
  def update
    respond_to do |format|
      if @calificacione.update(calificacione_params)
        format.html { redirect_to @calificacione, notice: 'Calificacione was successfully updated.' }
        format.json { render :show, status: :ok, location: @calificacione }
      else
        format.html { render :edit }
        format.json { render json: @calificacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificaciones/1
  # DELETE /calificaciones/1.json
  def destroy
    @calificacione.destroy
    respond_to do |format|
      format.html { redirect_to calificaciones_url, notice: 'Calificacione was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_calificacione
      @calificacione = Calificacione.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def calificacione_params
      params.require(:calificacione).permit(:correousuario, :restaurante, :calificacion)
    end
end
