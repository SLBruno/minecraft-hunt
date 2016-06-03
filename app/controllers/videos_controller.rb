class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy,]
  
    
# act_as_votable - https://github.com/ryanto/acts_as_votable    
  def index
      if params[:created_at]
      @videos = Video.order(:cached_votes_score => :desc).where(:created_at => params[:created_at]..Time.now)
      else
      @videos = Video.order(:created_at => :desc)
    end
  end  

        
  def new
    @video = Video.new
  end
    
  def create
  @video = Video.new(video_params)
  if @video.save
    flash[:success] = 'Video added!'
    redirect_to root_url
  else
    render :new
  end

  def edit
  end

  def show
  end
    
end
    
    def upvote
        @video = Video.find(params[:id])
        @video.upvote_by (current_user)
        redirect_to :back
    end
    
    def downvote
        @video = Video.find(params[:id])
        @video.downvote_by (current_user)
        redirect_to :back
    end

private
    def video_params
    params.require(:video).permit(:link)
    end
    
    def set_video
        @video = Video.find(params[:id])
    end
    

    
end
