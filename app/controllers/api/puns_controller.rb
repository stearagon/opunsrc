class Api::PunsController < ApplicationController
  def new
    if params[:tags].nil?
      @pun = Pun.new
    else
      @pun = Pun.new;
      @pun.topics << Topic.find(params[:tags]);
    end
  end

  def create
    @pun = Pun.new(pun_params)

    @pun.update_tags(params[:pun][:tags])

    if @pun.save
      redirect_to api_pun_url(@pun.id)
    else
      flash.now[:errors] = @pun.errors.full_messages
      render :new
    end
  end

  def update
    @pun = Pun.find(params[:id])

    @pun.update_tags(params[:pun][:tags])

    if @pun.update(pun_params)
      redirect_to api_pun_url(@pun.id)
    else
      flash.now[:errors] = @pun.errors.full_messages
      render :edit
    end
  end

  def show
    @pun = Pun.find(params[:id])
  end

  def destroy
    @pun = Pun.find(params[:id])

    @pun.destroy

    redirect_to api_puns_url
  end

  def index
    @puns = Pun.all.order(term: :asc)
  end

  def edit
    @pun = Pun.find(params[:id])

  end

  private
  def pun_params
    params.require(:pun).permit(:term, :pun, :example)
  end
end
