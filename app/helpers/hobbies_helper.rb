module HobbiesHelper
  def youtube_embed(youtube_url, args={})
    youtube_id = get_youtube_id(youtube_url)
    url = "https://www.youtube.com/embed/#{ youtube_id }"
    url += '?autoplay=1' if args[:autoplay]

    %Q{<div class="video-container"><iframe src="#{url}" frameborder="0"></iframe></div>}
  end

  def get_youtube_id(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      $5
    end
  end

  def youtube_thumbnail(youtube_url, args={})
    youtube_id = get_youtube_id(youtube_url)
    "https://img.youtube.com/vi/#{youtube_id}/mqdefault.jpg"
  end

  def visual_tag(visual)
    if visual.is_video?
      "<div class=\"visual-main video\">#{youtube_embed(visual.ref)}</div>"
    else
      "<div class=\"visual-main image\">#{image_tag(visual.ref)}</div>"
    end
  end

  def visual_thumb_tag(visual)
    if visual.is_video?
      "<div class=\"visual-thumb video\">#{image_tag(youtube_thumbnail(visual.ref))}<div class=\"play-overlay\"><div class=\"icon-wrapper\"><span class=\"glyphicon glyphicon-play\" aria-hidden=\"true\"></span></div></div></div>"
    else
      "<div class=\"visual-thumb video\">#{image_tag(visual.ref)}</div>"
    end
  end
end
