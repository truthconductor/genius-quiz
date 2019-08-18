class QuizSectionsController < ApplicationController

  def index
    @quiz_sections = QuizSection.all()
  end

  def show
  end

  def edit
  end

  def create
  end
end
