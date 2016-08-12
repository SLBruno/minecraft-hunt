class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]
    skip_before_filter :require_login, :only => [:edit,:update, :destroy] 
  
    
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

    def destroy
    @video.destroy
    redirect_to root_path, notice: "O seu vídeo foi apagado!"
  end
    
  def create
  @video = Video.new(video_params)
  @video.user = current_user
  if @video.save
    if @video.title.include?("Minecraft") or 
      @video.title.include?("MINECRAFT") or
      @video.title.include?("minecraft") or
      @video.description.include?("Minecraft") or
      @video.description.include?("MINECRAFT") or
      @video.description.include?("minecraft")
    flash[:success] = 'Video adicionado - ele contem minecraft!'
    redirect_to root_url
  else
    flash[:success] = 'O vídeo não contem Minecraft em seu título ou descrição!'
    @video.destroy
    render :new
  end 
  else
    render :new
  end

  def edit
  end

  def show
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

end 

private

    def video_params
    params.require(:video).permit(:link, :users_id) 
    end
    
    def set_video
        @video = Video.find(params[:id])
    end
       
end

