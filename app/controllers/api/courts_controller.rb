class Api::CourtsController < ApplicationController
  def index
    render json: Court.all.to_json
  end

  def show
    render json: Court.find(params[:id]).to_json
  end
end
