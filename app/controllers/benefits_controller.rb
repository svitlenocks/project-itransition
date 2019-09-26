class BenefitsController < ApplicationController
  before_action :set_benefit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :admin?, except: [:new, :create, :destroy, :edit, :update]
  before_action :locked?
  # GET /benefits
  # GET /benefits.json
  def index
    @benefits = Benefit.all
  end

  # GET /benefits/1
  # GET /benefits/1.json
  def show
  end

  # GET /benefits/new
  def new
    @benefit = Benefit.new
    $compaign_id_from_request = request.params[:format]
  end

  # GET /benefits/1/edit
  def edit
  end

  # POST /benefits
  # POST /benefits.json
  def create
    @benefit = Benefit.new(benefit_params)
    @benefit.compaign_id = $compaign_id_from_request
    #@compaign = current_user.compaigns.find_by(benefit_params[:compaign_id])
    #@compaign = :current_compaign
    respond_to do |format|
      if @benefit.save
        format.html { redirect_to Compaign.find_by(id: $compaign_id_from_request), notice: 'Benefit was successfully created.' }
        format.json { render :show, status: :created, location: @benefit }
      else
        format.html { render :new }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefits/1
  # PATCH/PUT /benefits/1.json
  def update
    respond_to do |format|
      if @benefit.update(benefit_params)
        format.html { redirect_to Compaign.find_by(id: @benefit.compaign_id), notice: 'Benefit was successfully updated.' }
        format.json { render :show, status: :ok, location: @benefit }
      else
        format.html { render :edit }
        format.json { render json: @benefit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefits/1
  # DELETE /benefits/1.json
  def destroy
    @benefit.destroy
    respond_to do |format|
      format.html { redirect_to Compaign.find_by(id: @benefit.compaign_id), notice: 'Benefit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def locked?
      redirect_to pages_lock_path if  current_user && current_user.locked
    end

    def admin?
      if !current_user.admin
        redirect_to root_path
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefit_params
      params.require(:benefit).permit(:reward, :description, :sum, :compaign_id)
    end
end
