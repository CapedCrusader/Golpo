class MicropostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :update, :delete]
  before_filter :correct_user,  only: [:edit, :update, :destroy]

  def index
  end
  
  def new
    @micropost = Micropost.new
    @micropost.categories.build
  end 

  def create
    @micropost = current_user.microposts.build(params[:micropost])
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end
  
  def update
    if @micropost.update_attributes(params[:micropost])
      flash[:success] = "Post updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_path
  end


  private

    def correct_user
      @micropost = current_user.microposts.find_by_id(params[:id])
      redirect_to root_path if @micropost.nil?
    end
end 
