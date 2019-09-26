class CompaignsController < ApplicationController
  before_action :set_compaign, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show, :index, :posts] 
  before_action :locked?, except: [:show, :index]
  protect_from_forgery except: :index
  # GET /compaigns
  # GET /compaigns.json

  $categories = %w(Art Comics Crafts Dance Design Fashion Film&Video Food Games Journalism Music Photography Publishing Technology Theater)


  def index
    @compaigns = Compaign.with_attached_image.includes(:user).paginate(page: params[:page], per_page: 6)
    @user = current_user
  end

  def posts
    @user = current_user
    @compaign = Compaign.includes(:posts).find(params[:id])
  end

  # GET /compaigns/1
  # GET /compaigns/1.json
  def show
   @user = current_user
   @results = parse_video_url(@compaign.video)
   @comment = Comment.new
   @comments = @compaign.comments
  end

  def support
    @compaign = Compaign.find_by(id: request.params[:format])
  end

  def update_current_sum
    @compaign = Compaign.find_by(id: request.params[:format])
    @compaign.update_attribute(:current_sum, @compaign.current_sum + [0, params[:compaign][:current_sum].to_i].max)
    if params.keys[4] != "commit"
      current_user.update_attribute(:benefits, current_user.benefits << params.keys[4])
    end
    flash[:notice] = "Thanks for the help!"
    redirect_to @compaign
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
        format.html { redirect_to new_benefit_url(@compaign), notice: 'Compaign was successfully created.' }
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

    def parse_video_url(url)
    @url = url

    youtube_formats = [
        %r(https?://youtu\.be/(.+)),
        %r(https?://www\.youtube\.com/watch\?v=(.*?)(&|#|$)),
        %r(https?://www\.youtube\.com/embed/(.*?)(\?|$)),
        %r(https?://www\.youtube\.com/v/(.*?)(#|\?|$)),
        %r(https?://www\.youtube\.com/user/.*?#\w/\w/\w/\w/(.+)\b)
      ]

    @url.strip!

    if @url.include? "youtu"
      youtube_formats.find { |format| @url =~ format } and $1
      @results = {provider: "youtube", id: $1}
      @results
    else
      return @results = nil # There should probably be some error message here
    end  
end

    def locked?
      redirect_to pages_lock_path if  current_user && current_user.locked
    end

    def set_compaign
      @compaign = Compaign.with_attached_image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compaign_params
      params.require(:compaign).permit(:title, :project_idea, :description, :goal, :endtime, :video, :category, :image, :current_sum)
    end
end
