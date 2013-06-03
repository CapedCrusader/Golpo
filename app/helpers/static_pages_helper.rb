module StaticPagesHelper
  def summary(feed_item)
    x = feed_item.content
    @sh_data = Hash[*x.split(/ ::: | && /)]
    return @sh_data["keytwo"]
  end

  def video(url)
  	return (a = url["?v="]) ? url.split("?v=")[1] : url.split("/")[-1]
  end

  
end

