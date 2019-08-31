class QuestionsController < ApplicationController
  def show
    @question = Question.find(params[:id])
  end

  def answer
    #解答チェック
    user_answer = ActiveRecord::Type::Boolean.new.cast(answer_params[:answer])
    #悲観的ロック
    Question.transaction do
      #問題
      @question = Question.find(answer_params[:id])
      #クイズ作成者か判断
      isChallenger = @question.quiz.user.id != current_user&.id
      #問題が正解か判断
      @is_correct = user_answer == @question.is_yes

      #正解
      if @is_correct
        #次の問題を取得
        @next_question = Question.where(quiz_id: @question.quiz_id, order: @question.order+1).first
        #データベース更新
        if isChallenger
          #出題回数正解回数更新
          @question.total_answer_counts = @question.total_answer_counts+1
          @question.correct_answer_counts = @question.correct_answer_counts+1
          @question.save
          #最終問題正解（次の問題が無い）
          unless @next_question
            #クイズ通算成績更新
            quiz = @question.quiz
            quiz.question_times = quiz.question_times + 1
            quiz.genius_times = quiz.genius_times + 1
            quiz.save
          end
        end
      #不正解
      else
        if isChallenger
          #出題回数正解回数更新
          @question.total_answer_counts = @question.total_answer_counts+1
          @question.save
          #クイズ通算成績更新
          quiz = @question.quiz
          quiz.question_times = quiz.question_times + 1
          quiz.save
        end
      end
    end
  end


  private
    def answer_params
      params.require(:post).permit(:answer).merge(id: params[:id], quiz_id: params[:quiz_id])
    end
end
