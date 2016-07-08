class CommentsController < ApplicationController
  before_action :set_post

  # POST /comments
  def create
    @comment = @post.comments.create! comment_params
    CommentsMailer.submitted(@comment).deliver_later
    
    respond_to do |format|
      format.html { redirect_to @post }
      format.js {}
    end
  end

  private
    def set_post
      @post = Post.find(params[:post_id])
    end
    
    def comment_params
      params.require(:comment).permit(:content, :author)
    end
end
