class CategoriesController < ApplicationController
  before_filter :signed_in_user, only: [:create]

  def new
    @categories = Category.new
  end

  def index
    @categories = Category.paginate(page: params[:page])
  end

  def create
    @categories= Category.new(params[:Category])
    if @category.save
      flash[:success] = "New category created!"
      redirect_to @category
    else
      render 'new'
    end
  end

  def show
    @categories  = Category.find(params[:id])
    @posts  = @categories.posts.paginate(page: params[:page])
  end

end
