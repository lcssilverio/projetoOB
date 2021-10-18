class PostsController < ApplicationController

    def index 
        @posts = Post.order(titulo: :desc)
    end

    def create
        post = params.require(:post).permit(:titulo, :texto, :autor)
        Post.create post
        redirect_to root_path
    end
end
