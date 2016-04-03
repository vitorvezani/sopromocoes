class CommentsController < ApplicationController
  add_breadcrumb "Comentários", :comments_path

  before_action :set_comment, only: [:edit, :update, :destroy, :upvote]

  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :upvote]
  before_action :require_ownership, only: [:edit, :update, :destroy]

  def create

    @comment = Comment.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        @success = 'Comentário criado com sucesso!'
        format.js {}
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy unless @error

    @success = 'Comentário excluido com sucesso!'

    respond_to do |format|
      format.js {}
      #format.html { redirect_to comments_url, notice: 'Loja foi excluida com sucesso.' }
      #format.json { head :no_content }
    end
  end

  def upvote

    unless current_user.voted_for? @comment
      @comment.liked_by current_user
      @success = 'Comentário curtido com sucesso!'
    else
      @comment.unliked_by current_user
      @success = 'Comentário descurtido com sucesso!'
    end


    respond_to do |format|
      format.js {}
      #format.html { redirect_to comments_url, notice: 'Loja foi excluida com sucesso.' }
      #format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:title, :comment, :commentable_id, :commentable_type)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def require_ownership
      if !owns_record(@comment)
        @error = 'Você não tem autoridade para criar/deletar/alterar esse comentário'
      end
    end

end
