class CommentsController < ApplicationController
  before_action :load_commentable

  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end

  def create
    @comment = @commentable.comments.new comments_params
    if @comment.save
      flash[:notice] = 'Comentário adicionado com sucesso!'
      redirect_to @commentable
    else
      rendering :new
    end
  end

  def destroy
    @coment.destroy
    flash[:notice] = 'Comentário removido!'
    redirect_to @commentable
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

  def load_commentable
    @commentable = Post.find(params[:post_id])
  end
end
