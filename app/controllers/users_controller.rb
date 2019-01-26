class UsersController < ApplicationController
  before_action :require_user_logged_in,
  only: [
    :index, :show, :new, :create,
    :edit, :update, :destroy
  ]

  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = '管理者を登録しました。'
      redirect_to users_path
    else
      flash[:danger] = '管理者を登録できませんでした。'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = '管理者情報を更新しました。'
      redirect_to @user
    else
      flash[:danger] = '管理者情報を更新できませんでした。'
      render :edit
    end
  end

  def destroy
    if User.all.length > 1
      @user = User.find(params[:id])
      @user.destroy
      flash[:success] = '管理者を削除しました。'
    else
      flash[:danger] = '管理者が1人しか登録されていないため、削除できません。'
    end
    redirect_to users_path
  end

  private

  def user_params
    params.
    require(:user)
    .permit(
      :name, :email, :password,
      :password_confirmation
    )
  end
end
