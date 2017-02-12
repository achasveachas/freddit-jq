class ConversationsController < ApplicationController
  def index
    @conversations = Conversation.order(sort_column: :desc).page(params[:page])
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
