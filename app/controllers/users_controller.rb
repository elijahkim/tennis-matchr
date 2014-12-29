class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = sign_up(user_params)

    if @user.valid?
      sign_in(@user)
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    user
  end

  def index
    @users = User.all.order(created_at: :desc).page params[:page]
  end

  private

  def user_params
    params.require(:user).permit(
      :bio,
      :email,
      :first_name,
      :image_url,
      :last_name,
      :password,
      :rank,
      :username
    )
  end

  def user
    @user ||= User.find(params[:id])
  end
end

