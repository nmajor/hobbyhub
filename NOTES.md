How to get the description from the id
https://stackoverflow.com/questions/30241276/how-to-get-youtube-video-description-with-video-id

https://www.googleapis.com/youtube/v3/videos?part=snippet&id={VIDEO_ID}&fields=items/snippet/title,items/snippet/description&key={YOUR_API_KEY}


Trait.where(type: "Video").each{|t| t.update(type: 'Visual') }
