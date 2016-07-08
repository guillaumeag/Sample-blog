class Admin::CommentsController < Admin::AdminController
  before_action :set_comment, only: [:destroy]

  # GET admin/comments
  # GET admin/comments.json
  def index
    @comments = Comment.all
  end

  # DELETE admin/comments/1
  # DELETE admin/comments/1.json
  def destroy
    @comment.destroy
    @comments = Comment.all

    respond_to do |format|
      format.html { redirect_to admin_comments_url, notice: 'Comment was successfully destroyed.' }
      format.js {}
    end
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
