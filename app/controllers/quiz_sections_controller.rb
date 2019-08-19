class QuizSectionsController < ApplicationController

  def index
    @quiz_sections = QuizSection.all
  end

  def show
  end

  def edit
    @quiz_section = QuizSection.find(params[:id])
  end

  def update
    @quiz_section = QuizSection.find(params[:id])
    if @quiz_section.update(section_params)
      redirect_to quiz_section_path
    else
      render :edit
    end
  end

  def new
    @quiz_section = QuizSection.new
    for order in 1..5 do
      @quiz_section.quizzes.build(order: order, is_yes: true)
    end
  end

  def create
    @quiz_section = QuizSection.new(section_params)

    if @quiz_section.save
      redirect_to quiz_section_path
    else
      render :new
    end
  end

  def destroy
    @quiz_section = QuizSection.find(params[:id])
    @quiz_section.destroy

  private

  def section_params
    params.require(:quiz_section).permit(:title, :description, :image,
      quizzes_attributes: [:id, :order, :sentence, :is_yes, :explanation])
  end
end
