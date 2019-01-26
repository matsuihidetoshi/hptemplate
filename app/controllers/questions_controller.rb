class QuestionsController < ApplicationController
  before_action :require_user_logged_in,
  only: [
    :index, :show, :edit, :update, :destroy
  ]
  def index
    @questions = Question.all.page(params[:page]).order(created_at: 'DESC')
  end

  def show
    @question = Question.find(params[:id])
    if params[:check].to_i == 1
      @question.update_attributes(checked: false)
      flash.now[:success] = '未回答にしました。'
    elsif params[:check].to_i == 2
      @question.update_attributes(checked: true)
      flash.now[:success] = '解答済にしました。'
    end
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:success] = "お問い合わせが完了しました。"
      redirect_to root_path
    else
      flash.now[:danger] = "入力内容に誤りがあります。"
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def question_params
    params.
    require(:question).
    permit(:title, :content, :name, :address, :tel, :email)
  end

end
