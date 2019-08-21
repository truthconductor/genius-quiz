class QuizForm
  include ActiveModel::Model

  concerning :QuizBuilder do
    def quiz
      @quiz ||= Quiz.new
    end
  end

  concerning :QuestionsBuilder do
    attr_reader :questions_attributes

    def questions
      @questions_attributes ||= Question.new
    end

    def questions_attributes=(attributes)
      @questions_attributes = Question.new(attributes)
    end
  end

  attr_accessor :title, :description, :image,
  :question_times, :genius_times, :brilliant_times,

  def save
    return false if invalid?
    # 保存, 通知, ロギング等
    quiz.assign_attributes(quiz_param)
    build_asscociations
  end

  private
  def company_params
    {
      title: title,
      description: description,
      image: image,
      question_times: question_times,
      genius_times: genius_times,
      brilliant_times: brilliant_times,
    }
  end

  def build_asscociations
    quiz.questions << questions
  end
end