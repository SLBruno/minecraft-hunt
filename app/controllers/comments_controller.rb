class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  respond_to :html

  def index
    @comments = Comment.all
    respond_with(@comments)
  end

  def show
    respond_with(@comment)
  end

  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def edit
  end

  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.new(comment_params)
    @comment.user = current_user
    
    respond_to do |format|
        if @comment.save
            format.html { redirect_to @video, notice: "O comentário foi criado com sucesso"}
            format.json { render json: @comment, status: :created, location: @comment}
        else
            format.html { render action: "new"}
            format.json { render json: @comment, status: :unprocessable_entity}
        end
    end
  end

  def update
    @comment.update(comment_params)
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_with(@comment)
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:video_id, :body, :user_id)
    end
end
