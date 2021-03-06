
class UsersController < ApplicationController

  before_filter :signed_in_user, only: [:edit, :update, :index, :delete, :following, :followers]
  before_filter :correct_user,  only: [:edit, :update]
  before_filter :admin_user,  only: :destroy
  def show
    @user = User.find(params[:id])
  end 

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save 
      sign_in @user
      flash[:success] = "Welcome to Golpo!"
      redirect_to users_path
    else
      render 'new'
    end
  end
 
  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user 
    else
      render 'edit'
    end
  end

  def index
    @users = User.order("RANDOM()").first(10)
    @posts = Post.order("RANDOM()").first(10)
    respond_to do |format|
      format.js
      format.html # index.html.erb
      format.json { render json: @posts }
    end  
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def get_random_posts_for_index_page
    Post.order("RAND()").first(10)
  end

  private
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
