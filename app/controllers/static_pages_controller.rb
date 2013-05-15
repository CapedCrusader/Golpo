
class StaticPagesController < ApplicationController
  helper_method :all
  
  def home
    if signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page]).per_page(10)
      
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def summary(feed_item)
    x = feed_item.content
    @sh_data = Hash[*x.split(/ ::: | && /)]
    return @sh_data["keytwo"]
  end

  
end
