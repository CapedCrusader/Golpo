class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :update, :delete]
  before_filter :correct_user,  only: [:edit, :update, :destroy]

  respond_to :html, :json
  def index
    respond_with(@posts = Post.all)
  end
  
  def new
    @posts = Post.new
    @posts.categories.build
  end 

  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:success] = "Post updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end


  private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end 
