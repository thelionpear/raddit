class TopicsController < ApplicationController
  before_action :set_sub 
  before_action :set_topic, only: [:show, :edit, :update, :destroy] 
  
  def index
    @topics = @sub.topics 
  end

  def show
  end

  def new
    @topic = Topic.new
    render :form 
  end

  def edit
    render :form 
  end

  def create
    @topic = @sub.topics.create(topic_params)
    if @topic.save 
      redirect_to [@sub, @topic]
    else 
      render :form 
    end 
  end 

  def update 
    if @topic.update(topic_params)
      redirect_to [@sub, @topic]
    else 
      render :form 
    end 
  end 

  def destroy
    @topic.destroy
    redirect_to sub_topics_path(@sub) 
  end 

  private 
    def set_sub 
      @sub = Sub.find(params[:sub_id])
    end 

    def set_topic 
      @topic = Topic.find(params[:id]) 
    end 

    def topic_params
      params.require(:topic).permit(:name, :body)
    end 
end
