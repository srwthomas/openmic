class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]


  before_action :redirect_guest, except: [:show, :index]
  before_action :authorize_modification, only: [:edit, :update, :destroy]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    # @user = current_user

    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:name, :instrument, :genre, :user_id)
    end

    def redirect_guest
      redirect_to root_path unless user_signed_in?
    end

    # def authorize_access
    #   @post = Post.find(params[:id])

    #   # return unless user_signed_in? && @post.private
    #   # return if @post.user_id == current_user.id
    #   # return if @post.private && @post.invited_users.include?(current_user.id.to_s)

    #   redirect_to posts_path
    # end

    def authorize_modification
      user_id = Post.find(params[:id]).user_id
      redirect_to root_path unless user_signed_in? &&
                                   user_id == current_user.id
    end
end
