class PostsController < ApplicationController

    before_action :authenticate_user!, :only => [:new, :create]

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
        @post = Post.new
        if @post.save
            redirect_to @Post
        else 
            render :new, status: :unprocessable_entity
        end 
    end 
end
