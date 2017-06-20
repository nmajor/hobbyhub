module HobbiesHelper
  def youtube_embed(youtube_url, args={})
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    url = "https://www.youtube.com/embed/#{ youtube_id }"
    url += '?autoplay=1' if args[:autoplay]

    %Q{<div class="video-container"><iframe width="853" height="480" src="#{url}" frameborder="0"></iframe></div>}
  end
end
