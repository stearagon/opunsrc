class RootController < ApplicationController

  def root
    @top_tags = Topic.top_20
    @top_puns = Pun.top_20
    render :root
  end

end
