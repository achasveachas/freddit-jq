class CommentsController < ApplicationController
  def index
  end

  def show
    @comment = Comment.find_by_id(params[:id])
    render json: @comment
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
