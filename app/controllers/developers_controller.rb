class DevelopersController < ApplicationController
  #before_action :set_developer, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:new]
  layout "crud"

  # GET /developers
  # GET /developers.json
  def index
    @developers = Developer.all
  end

  # GET /developers/1
  # GET /developers/1.json
  def show
  end

  # GET /developers/new
  def new
    @developer = Developer.new
  end

  def dashboard
    @min = 50
    @developers = Developer.all
    @percent = (@developers.length * 100) / @min
  end
  
  # GET /developers/1/edit
  def edit
  end

  # POST /developers
  # POST /developers.json
  def create
    @developer = Developer.new(params[:developer])

    respond_to do |format|
      if @developer.save
        format.html { redirect_to @developer, notice: 'Registro exitoso! Revisaremos tu aplicacion, de ser seleccionado seras contactado via email para una entrevista. Gracias!' }
        format.json { render action: 'show', status: :created, location: @developer }
      else
        format.html { render action: 'new' }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /developers/1
  # PATCH/PUT /developers/1.json
  def update
    respond_to do |format|
      if @developer.update(params[:developer])
        format.html { redirect_to @developer, notice: 'Desarrollador actualizado.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @developer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /developers/1
  # DELETE /developers/1.json
  def destroy
    @developer.destroy
    respond_to do |format|
      format.html { redirect_to developers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_developer
      @developer = Developer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def developer_params
      params.require(:developer).permit(:name, :last_name, :email, :phone, :address, :why_hack, :scholarship, :why_scholarship)
    end
end
