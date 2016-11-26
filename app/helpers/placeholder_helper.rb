module PlaceholderHelper
  def render_placeholder_thumb(picture)
    if picture.present?
      image_tag(picture.thumb.url, class:"thumbnail")
    else
      image_tag("http://placehold.it/200x200&text=#{picture}", class:"thumbnail")
    end
  end
end
