class Quiz < ApplicationRecord

  #バリデーション
  validates :title, presence: true, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 100 }

  #アソシエーション
  belongs_to :user
  has_many :questions, ->{ order(:order) }, dependent: :destroy, inverse_of: :quiz
  accepts_nested_attributes_for :questions

  def genius_rate
    if question_times == 0
      return 0
    else
      (100*genius_times/question_times).round(1)
    end
  end
end
