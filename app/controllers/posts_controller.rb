class PostsController < ApplicationController

    before_action :set_post, only: [:edit, :update, :destroy]

    def index 
        @posts = Post.order(titulo: :desc)
    end

    def new
        @post = Post.new
        @tema = Tema.all
    end

    def create
        @post = Post.new posts_params
        if @post.save
            flash[:notice] = "Post criado!"
            redirect_to root_path
        else
            renderiza :new
        end
    end

    def destroy
        @post.destroy
        flash[:notice] = "Post removido!"
        redirect_to root_path        
    end

    def busca
        @titulo = params[:titulo]
        @posts = Post.where "titulo like ?", "%#{@titulo}%"
    end

    def edit
        renderiza :edit
    end

    def update
        if @post.update posts_params
            flash[:notice] = "Post atualizado!"
            redirect_to root_path
        else
            renderiza :edit
        end
    end

    private

    def posts_params
        params.require(:post).permit(:titulo, :texto, :tema_id, :autor)
    end

    def set_post
        @post = Post.find(params[:id])   
    end

    def renderiza(view)
        @tema = Tema.all
        render view
    end
end
