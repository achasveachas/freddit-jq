class CommentsController < ApplicationController
  before_action :find_commentable, only: [:new, :create, :edit, :update]

  def index
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    render json: @comment
  end

  def new
    @comment = @commentable.comments.build
    render 'comments/_form', layout: false
  end

  def create
    if current_user
      @comment = @commentable.comments.create(comment_params)
      @comment.user = current_user
      if @comment.save
        render 'comments/_comment', layout: false
      end
    else
      raise "You need to be logged in"
    end
  end

  def edit
    @comment = Comment.find_by_id(params[:id])
    render 'comments/_form', layout: false
  end

  def update
    @comment = Comment.find_by_id(params[:id])
    if can_edit?(@comment)
      @comment.update(comment_params)
      render json: @comment
    else
      render "You do not have permission to edit this resource"
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    @comment.body = "Comment Deleted"
    @comment.save
    redirect_to :back
  end

  private

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Conversation.find_by_id(params[:conversation_id]) if params[:conversation_id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
