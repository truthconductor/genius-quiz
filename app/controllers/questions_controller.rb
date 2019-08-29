class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def answer
    #解答チェック
    user_answer = answer_params[:answer] == "true" ? true : false
    @question = Question.find(answer_params[:id])

    #クイズ作成者でない回答か確認
    isChallenger = @question.quiz.user.id != current_user&.id

    #正解か
    @is_correct = user_answer == @question.is_yes

    if @is_correct
      @next_question = Question.where(quiz_id: @question.quiz_id, order: @question.order+1).first
      #データベース更新
      if isChallenger
        #出題回数正解回数更新
        @question.total_answer_counts = @question.total_answer_counts+1
        @question.correct_answer_counts = @question.correct_answer_counts+1
        @question.save
        #最終問題正解
        unless @next_question
          quiz = @question.quiz
          quiz.question_times = quiz.question_times + 1
          quiz.genius_times = quiz.genius_times + 1
          quiz.save
        end
      end
    else
      if isChallenger
        #出題回数正解回数更新
        @question.total_answer_counts = @question.total_answer_counts+1
        @question.save
        #出題回数更新
        quiz = @question.quiz
        quiz.question_times = quiz.question_times + 1
        quiz.save
      end
    end

  end


  private
    def answer_params
      params.require(:post).permit(:answer).merge(id: params[:id], quiz_id: params[:quiz_id])
    end
end
