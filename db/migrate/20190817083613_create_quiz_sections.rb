class CreateQuizSections < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_sections do |t|
      # タイトル
      t.string      :title, limit: 30, null: false
      # 説明
      t.text        :description, null: false
      # サムネイル画像
      t.string      :image
      # 作成者
      t.references  :user, null: false, foreign_key: true
      # 出題回数(挑戦者数)
      t.integer     :question_times, null: false, default: 0
      # 天才出現回数(全問正解者数)
      t.integer     :genius_times, null: false, default: 0
      # 秀才出現回数(最終問題不正解者数)
      t.integer     :brilliant_times, null: false, default: 0
      # 作成日、最終更新日
      t.timestamps
    end
  end
end
