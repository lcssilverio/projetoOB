class PostsController < ApplicationController

    def index 
        @posts = Post.order(titulo: :desc)
    end

    def create
        post = params.require(:post).permit(:titulo, :texto, :autor)
        Post.create post
        redirect_to root_path
    end

    def destroy
        id = params[:id]
        Post.destroy id
        redirect_to root_path        
    end

    def busca
        @titulo = params[:titulo]
        @posts = Post.where "titulo like ?", "%#{@titulo}%"
    end

end
