class SearchesController < ApplicationController
  def show
    @results = search.results
  end

  private

  def search
    @results = User.search do
      fulltext params[:search]
    end
  end
end
