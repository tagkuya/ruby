class PostsController < ApplicationController
    def index 
        @posts = Post.all.order(created_at:'desc')
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new()
    end

    def create
        #render plain: params[:post].inspect
        @post = Post.new(require_params)
        if @post.save
           redirect_to posts_path
        else
            render 'new'
        end
    end

    private
    def require_params
        params.require(:post).permit(:title,:body)
    end

end
