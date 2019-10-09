class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @comentarios = Comentario.all
    respond_to do |format|
      format.html {@comentarios}
      format.json {render json: {message: "SUCCESS",comentarios: @comentarios}, status: :ok}
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    if @comentario
      respond_to do |format|
        format.html
        format.json {render json: {message: "SUCCESS",comentario: @comentario}, status: :ok}
      end
    else
      respond_to do |format|
        format.html {redirect_to comentarios_path, notice: 'Ese usuario no existe'}
        format.json {render json: {message: "ERROR"},status: :not_found}
      end
    end
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(comentario_params)
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @comentario, notice: 'Comentario creado con exito.' }
        format.json { render json: { message: "SUCCESS", location: @comentario}, status: :ok }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario, notice: 'Comentario actualizado con exito.' }
        format.json { render json: {message: "SUCCESS", location: @comentario},status: :ok }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    if @comentario
      @comentario.destroy
      respond_to do |format|
        format.html { redirect_to comentarios_url, notice: 'Comentario destruido con exito.' }
        format.json {render json: {message: "Borrado"}, status: :ok}
      end
    else
      respond_to do |format|
        format.html {redirect_to comentarios_path, notice: 'Ese comentario no existe'}
        format.json {render json: {message: "ERROR"},status: :not_found}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:correousuario, :restaurante, :cuerpo_comentario)
    end
end
