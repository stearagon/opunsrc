class Api::LikesController < ApplicationController

  def create
    @like = Like.new(like_params)

    @like.save!

    redirect_to root_url

  end

  def destroy
    @like = Like.find(like_params[:id])

    @like.destroy

    redirect_to root_url
  end

  private
  def like_params
    params.require(:like).permit(:user_id, :likeable_type, :likeable_id)
  end

end
