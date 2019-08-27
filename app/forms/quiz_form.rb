class QuizForm
  include ActiveModel::Model

  DEFAULT_QUESTION_COUNT = 5

  def quiz
    @quiz ||= Quiz.new
  end

  attr_reader :questions_attributes

  def questions
    @questions_attributes ||= DEFAULT_QUESTION_COUNT.times.map {|i| Question.new(order: i+1, is_yes: true) }
  end

  # def initialize(quiz)
  #   @quiz = quiz
  # end

  def questions_attributes=(attributes)
    @questions_attributes = []
    attributes.each do |key, value|
      @questions_attributes << Question.new(value)
    end
  end

  attr_accessor :title,
                :description,
                :image,
                :user_id

  validate :validate_something

  def to_model
    Quiz.new(title: title, description: description, image: image, user_id: user_id)
  end

  def save?
    # バリデーションに引っかかる場合は以降の処理には行かせずfalseをコントローラーに返します
    return false if invalid?
    quiz.assign_attributes(quiz_params)

    Quiz.transaction do
      quiz.save!
      build_asscociations
      quiz.save!
      return true
    end

    return false
  end

  private

  def quiz_params
    {
      title: title,
      description: description,
      image: image,
      user_id: user_id
    }
  end

  def build_asscociations
    quiz.questions << questions
  end

  #バリデーション
  def validate_something
    # Do something
  end

end