class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, ->{ order(:order) }, dependent: :destroy, inverse_of: :quiz
  accepts_nested_attributes_for :questions
end
