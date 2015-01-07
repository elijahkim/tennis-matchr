class SearchesController < ApplicationController
  def show
    @results = search.results
  end

  private

  def search
    @results = Sunspot.search [User, Court] do
      fulltext params[:search]
    end
  end
end
