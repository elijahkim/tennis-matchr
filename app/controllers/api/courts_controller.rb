class Api::CourtsController < ApplicationController
  def index
    render json: Court.all.as_json(methods: [:average_elo])
  end

  def show
    render json: Court.find(params[:id]).to_json
  end
end
