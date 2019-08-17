class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      # 出題順
      t.integer     :order, null: false
      # 問題文
      t.text        :sentence, null: false
      # Yesが正解か
      t.boolean     :is_yes, null: false
      # 解説
      t.text        :explanation
      # 正解者数
      t.integer     :correct_answer_counts, null: false, default: 0
      # 総回答数
      t.integer     :total_answer_counts, null: false, default: 0
      # 出題区分
      t.references  :quiz_section, null: false, foreign_key: true
      t.timestamps
    end
  end
end
