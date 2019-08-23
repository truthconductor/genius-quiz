class RenameQuizSectionToQuiz < ActiveRecord::Migration[5.2]
  def change
    rename_table :quiz_sections, :quizzes
    rename_column :questions, :quiz_section_id, :quiz_id
  end
end
