class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.js   {}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :comment, :commentable_id, :commentable_type, :user_id)
    end
end
