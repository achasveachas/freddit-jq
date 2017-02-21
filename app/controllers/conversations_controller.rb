class ConversationsController < ApplicationController
  before_action :verify_user, only: [:new, :create, :edit, :update, :destroy]

  def index
    @conversations = Conversation.order(sort_column: :desc).page(params[:page])
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
  end

  def new
    @conversation ||= current_user.conversations.build
    @comment = @conversation.comments.build
  end

  def create
    @conversation = current_user.conversations.new(conversation_params)
    @comment = @conversation.comments.first
    @comment.user = current_user
    @comment.commentable = @conversation
    @comment.conversation = @conversation
    if @conversation.save && @comment.save
      redirect_to @conversation
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def conversation_params
    params.require(:conversation).permit(:topic, comments_attributes: [:body])
  end
end
