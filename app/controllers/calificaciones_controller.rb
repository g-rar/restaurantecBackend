class CalificacionesController < ApplicationController
  before_action :set_calificacione, only: [:show, :edit, :update, :destroy]

  # GET /calificaciones
  # GET /calificaciones.json
  def index
    @calificaciones = Calificacione.all
    respond_to do |format|
      format.html {@calificaciones}
      format.json {render json: {calificaciones: @calificaciones},status: :ok}
    end
  end

  # GET /calificaciones/1
  # GET /calificaciones/1.json
  def show
    if @calificacione
      respond_to do |format|
        format.html
        format.json {render json: @calificacione, status: :ok}
      end
    else
      respond_to do |format|
        format.html {redirect_to calificaciones_url}
        format.json {render json: {message: "ERROR"},status: :not_found}
      end
    end
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
        sum = 0
        count = 0
        Calificacione.all.each do |cal|
          if cal.restaurante == @calificacione.restaurante
            sum += cal.calificacion
            count += 1
          end
        end
        Restaurante.find(params[:restaurante]).update(calificacionrest: (sum/count))
        format.html { redirect_to @calificacione, notice: 'Calificacion creada con exito.' }
        format.json { render json: {status: :created, location: @calificacione},status: :ok }
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
        format.html { redirect_to @calificacione, notice: 'Calificacione creado con exito.' }
        format.json { render json:{ status: :ok, location: @calificacione }, status: :ok}
      else
        format.html { render :edit }
        format.json { render json: @calificacione.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calificaciones/1
  # DELETE /calificaciones/1.json
  def destroy
    if @calificacione
      @calificacione.destroy
      respond_to do |format|
        format.html { redirect_to calificaciones_url, notice: 'Calificacione destruido con exito.' }
        format.json { render json: {message: "SUCCESS"}, status: :ok}
      end
    else
      respond_to do |format|
        format.html { redirect_to calificaciones_url, notice: 'El restaurante no existe' }
        format.json {render json: {message: "ERROR"}, status: :not_found}
      end
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
