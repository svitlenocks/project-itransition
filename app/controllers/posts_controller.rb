class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]
  before_action :locked?
  before_action :have_compaigns?, except: [:show]
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @compaign = Compaign.includes(:posts).find_by(id: @post.compaign_id)
    @user = current_user
  end

  # GET /posts/new
  def new
    @post = Post.new
    $compaign_id_from_request = request.params[:format]
  end

  # GET /posts/1/edit
  def edit
    @user = current_user
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.compaign_id = $compaign_id_from_request

    respond_to do |format|
      if @post.save
        format.html { redirect_to updates_path(Compaign.find_by(id: @post.compaign_id)), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to updates_path(Compaign.find_by(id: @post.compaign_id)), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to updates_path(Compaign.find_by(id: @post.compaign_id)), notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def have_compaigns?
      redirect_to root_path if current_user && current_user.compaigns.length == 0
    end

    def locked?
      redirect_to pages_lock_path if  current_user && current_user.locked
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :image)
    end
end
