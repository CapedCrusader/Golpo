module StaticPagesHelper
  def summary(feed_item)
    x = feed_item.content
    @sh_data = Hash[*x.split(/ ::: | && /)]
    return @sh_data["keytwo"]
  end
end
