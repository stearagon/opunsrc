class Api::TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic
      render json: @topic
    else
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
