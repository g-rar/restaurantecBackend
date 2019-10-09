class RestaurantesController < ApplicationController
  before_action :set_restaurante, only: [:show, :edit, :update, :destroy]

  # GET /restaurantes
  # GET /restaurantes.json
  def index
    @restaurantes = Restaurante.all
    respond_to do |format|
      format.html {@restaurantes}
      format.json {render json: {status: "SUCCESS", restaurantes: @restaurantes}, status: :ok}
    end
  end

  # GET /restaurantes/1
  # GET /restaurantes/1.json
  def show
    if @restaurante
      respond_to do |format|
        format.html
        format.json {render json: {status: "SUCCESS", restaurante: @restaurante}, status: :ok}
      end
    else
      respond_to do |format|
        format.html
        format.json {render json: {status: "ERROR", message: "No se ha podido mostrar"}, status: :not_found}
      end
    end

  end

  # GET /restaurantes/new
  def new
    @restaurante = Restaurante.new
  end

  # GET /restaurantes/1/edit
  def edit
  end

  # POST /restaurantes
  # POST /restaurantes.json
  def create
    @restaurante = Restaurante.new(restaurante_params)

    respond_to do |format|
      if @restaurante.save
        format.html { redirect_to @restaurante, notice: 'Restaurante creado con exito.' }
        format.json { render json: {status: :created, location: @restaurante}, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurantes/1
  # PATCH/PUT /restaurantes/1.json
  def update
    respond_to do |format|
      if @restaurante.update(restaurante_params)
        format.html { redirect_to @restaurante, notice: 'Restaurante actualizado con exito.' }
        format.json { render json:{ status: "SUCCESS", location: @restaurante}, status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @restaurante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurantes/1
  # DELETE /restaurantes/1.json
  def destroy
    if @restaurante
      @restaurante.destroy
      respond_to do |format|
        format.html { redirect_to restaurantes_url, notice: 'Restaurante destruido con exito.' }
        format.json { render json: {message: "Borrado"},status: :ok }
      end
    else
      respond_to do |format|
        format.html {redirect_to restaurantes_url, notice: 'El usuario no existe.'}
        format.json {render json: {message: "ERROR"},status: :not_found}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurante
      @restaurante = Restaurante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurante_params
      params.require(:restaurante).permit(:nombrerest, :latitudrest, :longitudrest, :tiporest, :calificacionrest, :preciorest, :numtelefono)
    end
end
