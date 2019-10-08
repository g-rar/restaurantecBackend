class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :null_session

  # GET /usuarios
  # GET /usuarios.json
  #
  def index
    @usuarios = Usuario.all
    respond_to do |format|
      format.html { @usuarios }
      format.json { render json: {status: "SUCCESS", message: "Usuarios recolectados :D", usuarios: @usuarios}, status: :ok}
    end
  end

  # GET /usuarios/1
  # GET /usuarios/1.json
  def show
    if @usuario
      respond_to do |format|
        format.html
        format.json {render json: {status: "SUCCESS", message: "Se muestra el usuario", usuario: @usuario}, status: :ok}
      end
    else
      respond_to do |format|
        format.html
        format.json {render json: {status: "ERROR", message: "No se ha podido mostrar"}, status: :not_found}
      end
    end
  end

  # GET /usuarios/new
  def new
    @usuario = Usuario.new
  end

  # GET /usuarios/1/edit
  def edit
  end

  # POST /usuarios
  # POST /usuarios.json
  def create
    @usuario = Usuario.new(usuario_params)
    respond_to do |format|
      if @usuario.save
        format.html { redirect_to @usuario, notice: 'Usuario was successfully created.' }
        format.json { render json: {usuario: @usuario, status: :created, location: @usuario},status: :ok }
      else
        format.html { render :new }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1
  # PATCH/PUT /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to @usuario, notice: 'Usuario was successfully updated.' }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1
  # DELETE /usuarios/1.json
  def destroy
    @usuario.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: 'Usuario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find_by_idusuario(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usuario_params
      params.require(:usuario).permit(:correousuario, :nombreusuario, :apellidousuario, :contrasenausuario, :tipousuario)
    end
end
