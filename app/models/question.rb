class Question < ApplicationRecord

  #バリデーション
  validates :sentence, presence: true, length: { maximum: 200 }
  validates :is_yes, presence: true
  validates :explanation, length: { maximum: 200 }

  #アソシエーション
  belongs_to :quiz, inverse_of: :questions
  validates_presence_of :quiz
end
