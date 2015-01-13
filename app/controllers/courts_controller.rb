class CourtsController < ApplicationController
  def index
    @courts = Court.all
    @center_court = current_user.court || NullCourt.new
  end

  def show
    @court = find_court
  end

  def new
    @court = Court.new
  end

  def create
    @court = Court.new(court_params)

    if @court.save
      redirect_to @court
    else
      render :new
    end
  end

  def edit
    @court = find_court
  end

  def update
    @court = find_court
    @court.update(court_params)

    if @court.save
      redirect_to @court
    else
      render :edit
    end
  end

  def destroy
    find_court.destroy

    redirect_to courts_path
  end

  private

  def court_params
    params.require(:court).permit(:name, :address)
  end

  def find_court
    Court.find(params[:id])
  end
end
