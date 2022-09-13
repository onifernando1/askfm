class PostsController < ApplicationController

    before_action :authenticate_user!, :only => [:new, :create]
    skip_before_action :verify_authenticity_token


    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id]) 
    end 

    def new
        @post = Post.new
    end 

    def create
        @post = Post.new(post_params)
        @post.user = current_user
        if @post.save
            redirect_to root_path
        else 
            render :new, status: :unprocessable_entity
        end 
    end 

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path, status: :see_other
    end 

    private

    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end 
end
