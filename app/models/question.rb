class Question < ApplicationRecord
  belongs_to :quiz, inverse_of: :questions
  validates_presence_of :quiz
end
