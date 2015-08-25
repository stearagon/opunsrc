class Api::TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      redirect_to api_topic_url(@topic.id)
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])

    if @topic.update(topic_params)
      redirect_to api_topic_url(@topic.id)
    else
      flash.now[:errors] = @topic.errors.full_messages
      render :edit
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])

    @topic.destroy

    redirect_to api_topics_url
  end

  def index
    @topics = Topic.all
  end

  def edit
    @topic = Topic.find(params[:id])

  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
