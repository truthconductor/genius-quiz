class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, ->{ order(:order) }, inverse_of: :quiz, dependent: :destroy
  accepts_nested_attributes_for :questions
end
