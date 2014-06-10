class PromosController < ApplicationController
  before_action :set_promo, only: [:show, :edit, :update, :destroy]

  # GET /promos
  # GET /promos.json
  def index
    @promos = Promo.all
  end

  # GET /promos/1
  # GET /promos/1.json
  def show
  end

  # GET /promos/new
  def new
    @promo = Promo.new
  end

  # GET /promos/1/edit
  def edit
  end

  # POST /promos
  # POST /promos.json
  def create
    @promo = Promo.new(params[:promo])

    respond_to do |format|
      if @promo.save
        format.html { redirect_to @promo, notice: 'Promo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @promo }
      else
        format.html { render action: 'new' }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /promos/1
  # PATCH/PUT /promos/1.json
  def update
    respond_to do |format|
      if @promo.update(params[:promo])
        format.html { redirect_to @promo, notice: 'Promo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @promo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promos/1
  # DELETE /promos/1.json
  def destroy
    @promo.destroy
    respond_to do |format|
      format.html { redirect_to promos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promo
      @promo = Promo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promo_params
      params.require(:promo).permit(:name, :lapse, :year)
    end
end
