class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :toggle_published]
  helper_method :sort_column, :sort_direction

  # GET admin/posts
  # GET admin/posts.json
  def index
    if params[:search]
      @posts = Post.find_by_title(params[:search]).order(sort_column + " " + sort_direction)
    else
      @posts = Post.all.order(sort_column + " " + sort_direction)
    end
  end

  # GET admin/posts/1
  # GET admin/posts/1.json
  def show
  end

  # GET admin/posts/new
  def new
    @post = Post.new
  end

  # GET admin/posts/1/edit
  def edit
  end

  # POST admin/posts
  # POST admin/posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_url(@post), notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: admin_post_url(@post.errors), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT admin/posts/1
  # PATCH/PUT admin/posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to admin_post_url(@post), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: admin_post_url(@post.errors), status: :unprocessable_entity }
      end
    end
  end

  # DELETE admin/posts/1
  # DELETE admin/posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to admin_posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_published
    @post.published = !@post.published
    @post.save

    redirect_to admin_post_url(@post)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :published)
    end

    # Sort expense table : Get column. Use in controller and helper(set table header)
    def sort_column
      Post.column_names.include?(params[:sort]) ? params[:sort] : "created_at"
    end
    
    # Sort expense table : Get direction. Use in controller and helper(set table header)
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
