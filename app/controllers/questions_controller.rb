class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def answer
    #解答チェック
    user_answer = answer_params[:answer] == "true" ? true : false
    @question = Question.find(answer_params[:id])

    @is_correct = user_answer == @question.is_yes

    if @is_correct
      @next_question = Question.where(quiz_id: @question.quiz_id, order: @question.order+1).first
    else
    end

  end


  private
    def answer_params
      params.require(:post).permit(:answer).merge(id: params[:id], quiz_id: params[:quiz_id])
    end
end
