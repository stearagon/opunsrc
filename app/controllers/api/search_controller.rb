class Api::SearchController < ApplicationController

  def search
    @search_results = PgSearch
      .multisearch(params[:query])
      .includes(:searchable)
      render :search
  end

end
