class QuizzesController < ApplicationController

  before_action(:move_to_index, except: [:index, :show])

  def index
    @quizzes = Quiz.all.order(updated_at: :desc)
  end

  def show
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end

  def update
    @quiz = Quiz.find(params[:id])
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
    @quiz = Quiz.find(params[:id])
    @quiz.destroy
    redirect_to quizzes_path
  end

  private

  def quiz_params
    params.require(:quiz).permit(:title, :description, :image,
      questions_attributes: [:id, :order, :sentence, :is_yes, :explanation])
      .merge(user_id: current_user&.id)
  end

  def move_to_index
    #ログインしていない時indexアクションを強制的に実行する
    unless user_signed_in?
      redirect_to action: :index
    end
  end

end
