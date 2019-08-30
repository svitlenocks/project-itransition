class CompaignsController < ApplicationController
  before_action :set_compaign, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  # GET /compaigns
  # GET /compaigns.json
  def index
    @compaigns = Compaign.all
  end

  # GET /compaigns/1
  # GET /compaigns/1.json
  def show
  end

  # GET /compaigns/new
  def new
    @compaign = Compaign.new
  end

  # GET /compaigns/1/edit
  def edit
  end

  # POST /compaigns
  # POST /compaigns.json
  def create
    @compaign = Compaign.new(compaign_params)
    @compaign.user = current_user
    respond_to do |format|
      if @compaign.save
        format.html { redirect_to @compaign, notice: 'Compaign was successfully created.' }
        format.json { render :show, status: :created, location: @compaign }
      else
        format.html { render :new }
        format.json { render json: @compaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compaigns/1
  # PATCH/PUT /compaigns/1.json
  def update
    respond_to do |format|
      if @compaign.update(compaign_params)
        format.html { redirect_to @compaign, notice: 'Compaign was successfully updated.' }
        format.json { render :show, status: :ok, location: @compaign }
      else
        format.html { render :edit }
        format.json { render json: @compaign.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compaigns/1
  # DELETE /compaigns/1.json
  def destroy
    @compaign.destroy
    respond_to do |format|
      format.html { redirect_to compaigns_url, notice: 'Compaign was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compaign
      @compaign = Compaign.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compaign_params
      params.require(:compaign).permit(:title, :description, :goal, :endtime, :video)
    end
end
