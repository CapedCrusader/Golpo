class PostsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :edit, :update, :delete]


  include ActionView::Helpers::SanitizeHelper
  
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end    
  end

  def show
    @post = Post.find(params[:id])
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
    s = @post.content
    @show_data = Hash[*s.split(/ ::: | && /)]
    @youtube = strip_tags(@show_data["youtube"])
    @urls = strip_tags(@show_data["urls"]).split("&nbsp;")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end
  
  def new
    @post = Post.new
       
    respond_to do |format|
      format.js
      format.html #new.html.erb
      format.json { render json: @post }
      
    end
  end 

  def edit
    @post = Post.find(params[:id])
    
    s = @post.content
    @show_data = Hash[*s.split(/ ::: | && /)]
    @youtube = strip_tags(@show_data["youtube"])
    @urls = strip_tags(@show_data["urls"]).split("&nbsp;")
    
  end

  def create
    @post = current_user.posts.build(params[:post])

    respond_to do |format|
      if @post.save
        format.js
        format.html { redirect_to root_path, notice: 'Post was successfully created.'}
        format.json { render json: @post, status: :created, location: @post }
        
	return
      else
        format.js
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
        
      end
    end
  end

  
  def update
    @post = Post.find(params[:id])
    
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to root_path, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  
  

  private

    def correct_user
      @post = current_user.posts.find_by_id(params[:id])
      redirect_to root_path if @post.nil?
    end
end 
