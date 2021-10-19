class PostsController < ApplicationController

    def index 
        @posts = Post.order(titulo: :desc)
    end

    def new
        @post = Post.new
        @tema = Tema.all
    end

    def create
        valores = params.require(:post).permit(:titulo, :texto, :autor)
        @post = Post.new valores
        if @post.save
            flash[:notice] = "Post criado!"
            redirect_to root_path
        else 
            render :new
        end
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
