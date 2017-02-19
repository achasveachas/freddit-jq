class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.order(sort_column: :desc).page(params[:page])
  end

  def show
    @conversation = Conversation.find_by_id(params[:id])
  end

  def new
    if !current_user
      flash[:error] = "You must log in to start a conversation"
      redirect_to signin_path
    else
      @conversation = current_user.conversations.build
    end
  end

  def create
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
