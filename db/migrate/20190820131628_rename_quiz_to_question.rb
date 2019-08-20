class RenameQuizToQuestion < ActiveRecord::Migration[5.2]
  def change
    rename_table :quizzes, :questions
  end
end
