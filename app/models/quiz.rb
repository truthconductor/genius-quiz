class Quiz < ApplicationRecord
  belongs_to :user
  has_many :questions, ->{ order(:order) }, dependent: :destroy
  accepts_nested_attributes_for :questions
end
