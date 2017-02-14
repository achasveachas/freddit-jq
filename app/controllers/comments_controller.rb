class CommentsController < ApplicationController
  before_action :find_commentable, only: [:new, :create]

  def index
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    render json: @comment
  end

  def new
    render 'comments/_form', layout: false
  end

  def create
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
    params.require(:comment).allow(:body)
  end

end
