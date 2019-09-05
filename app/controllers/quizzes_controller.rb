class QuizzesController < ApplicationController

  #ログインしていない場合ログインページへ移動する
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @quizzes = Quiz.all.includes([:user, :questions]).order(updated_at: :desc)
  end

  def show
  end

  def edit
    find_quiz_params_id
  end

  def update
    find_quiz_params_id
    if @quiz.update(quiz_params)
      redirect_to quizzes_path
    else
      render :edit
    end
  end

  def new
    @quiz = Quiz.new
    for order in 1..5 do
      @quiz.questions.build(order: order, is_yes: true)
    end
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to quizzes_path
    else
      render :new
    end
  end

  def destroy
    find_quiz_params_id
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

  def find_quiz_params_id
    @quiz = Quiz.find(params[:id])
    if @quiz.user.id != current_user&.id
      redirect_to action: :index
    end
  end

  def quiz_params
    params.require(:quiz).permit(:title, :description, :image,
      questions_attributes: [:id, :order, :sentence, :is_yes, :explanation])
      .merge(user_id: current_user&.id)
  end

end
