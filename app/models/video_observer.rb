class VideoObserver < ActiveRecord::Observer
  def before_save(resource)
    video = Yt::Video.new url: resource.link
    resource.uid = video.id
    resource.title = video.title
    resource.likes = video.like_count
    resource.description = video.description
    resource.dislikes = video.dislike_count
    resource.published_at = video.published_at
    resource.channel = video.channel_title
    resource.category = video.category_title
    resource.views = video.view_count
    resource.duration = video.duration
  rescue Yt::Errors::NoItems
    resource.title = ''
  end
end