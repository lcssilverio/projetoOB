class PostsController < ApplicationController
  before_action :set_post, only: %i[edit update destroy]
  def index
    @posts = Post.order(titulo: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @commentable = @post
    @comments = @commentable.comments
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new posts_params
    if @post.save
      flash[:notice] = 'Post criado!'
      redirect_to root_path
    else
      rendering :new
    end
  end

  def busca
    @titulo = params[:titulo]
    @posts = Post.where 'titulo like ?', "%#{@titulo}%"
  end

  def edit
    rendering :edit
  end

  def update
    if @post.update posts_params
      flash[:notice] = 'Post atualizado!'
      redirect_to root_path
    else
      rendering :edit
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post removido!'
    redirect_to root_path
  end

  private

  def posts_params
    params.require(:post).permit(:titulo, :texto, :autor)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
