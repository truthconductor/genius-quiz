# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  email: "hoge@hoge.com",
  password: "hogehoge",
  password_confirmation: "hogehoge",
  created_at: Time.zone.now,
  updated_at: Time.zone.now,
)

quiz = Quiz.create(
  title: "寿司ネタ漢字クイズ",
  description: "寿司ネタ漢字で読めますか？",
  user_id: user.id,
)
Question.create(
  sentence: "「鮭」の読み方は「サケ」である？",
  order: 1,
  is_yes: true,
  explanation: "鮭」の読み方は「サケ」です",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "「鮪」の読み方は「マグロ」である？",
  order: 2,
  is_yes: true,
  explanation: "「鮪」の読み方は「マグロ」です",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "「鮃」の読み方は「カレイ」である？",
  order: 3,
  is_yes: false,
  explanation: "「鮃」の読み方は「ヒラメ」で、「カレイ」は「鰈」です",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "「鱈」の読み方は「ブリ」である？",
  order: 4,
  is_yes: false,
  explanation: "「鱈」の読み方は「タラ」で、「ブリ」は「鰤」です",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "「鰆」の読み方は「サワラ」である？",
  order: 5,
  is_yes: true,
  explanation: "「鰆」の読み方は「サワラ」です",
  quiz_id: quiz.id,
)

quiz = Quiz.create(
  title: "名古屋クイズ",
  description: "名古屋人なら知ってて常識だがね",
  user_id: user.id,
)
Question.create(
  sentence: "名古屋のソウルフードとも言われるご当地ラーメンはスガキヤラーメンである？",
  order: 1,
  is_yes: true,
  explanation: "スガキヤラーメンは名古屋発祥の東海地方を中心に３００店舗以上を展開するラーメンチェーン店です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "名古屋城を築城したのは織田信長である？",
  order: 2,
  is_yes: false,
  explanation: "名古屋城を築城したのは徳川家康です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "トリップアドバイザーで「外国人旅行者が選ぶ夏のフォトジェニック観光スポット」\n国内第２位となった名古屋の観光地は「名古屋港水族館」である？",
  order: 3,
  is_yes: false,
  explanation: "栄にある複合施設「オアシス21 」が選ばれています。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "味噌煮込みうどん専門店の山本屋本店と山本屋総本家、飲食店舗数が多いのは山本屋本店である？",
  order: 4,
  is_yes: true,
  explanation: "山本屋本店は１４店舗、山本屋総本家は８店舗営業しています。\n２０１９年８月時点（姉妹店、今池ガスビル店を含む）",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "名鉄百貨店前にある巨大マネキン「ナナちゃん人形」の妹の名前は「ネネちゃん」である？",
  order: 5,
  is_yes: false,
  explanation: "一般公募により「ミナちゃん」と名付けられました。\nナナちゃんの1/6サイズで名鉄百貨店本店内にいます。",
  quiz_id: quiz.id,
)

quiz = Quiz.create(
  title: "日本史クイズ",
  description: "小学生で習う日本史の問題です。\n知ってて当たり前？",
  user_id: user.id,
)
Question.create(
  sentence: "平安時代文学作品「源氏物語」の作者は「清少納言」である？",
  order: 1,
  is_yes: false,
  explanation: "「源氏物語」の作者は「紫式部」です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "関ヶ原の合戦は西暦１６００年に起こった？",
  order: 2,
  is_yes: true,
  explanation: "関ヶ原の合戦は１６００年１０月２１日（慶長5年9月15日）に起こりました。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "江戸幕府第１５代将軍は「徳川吉宗」である？",
  order: 3,
  is_yes: false,
  explanation: "第１５代将軍は「徳川慶喜」です。\n「徳川吉宗」は第８代将軍です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "日本の初代総理大臣は「板垣退助」である？",
  order: 4,
  is_yes: false,
  explanation: "日本の初代総理大臣は「伊藤博文」です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "１９２５年の普通選挙法で与えられた男子の選挙権年齢は「３０才以上」である？",
  order: 5,
  is_yes: false,
  explanation: "「２５才以上」の男子に選挙権が与えられました。",
  quiz_id: quiz.id,
)

quiz = Quiz.create(
  title: "星のカービィクイズ",
  description: "カービィに関するクイズ。カービィ愛がないと難しいかも？",
  user_id: user.id,
)
Question.create(
  sentence: "カービィが食べると無敵になるアイテムは「スター」である？",
  order: 1,
  is_yes: false,
  explanation: "カービィが食べると無敵になるアイテムは「無敵キャンディ」です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "カービィの苦手なものは芋虫である？",
  order: 2,
  is_yes: false,
  explanation: "カービィの苦手なものは毛虫です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "ニンテンドーDSで発売されたカービィシリーズ作品は計４本である？",
  order: 3,
  is_yes: true,
  explanation: "タッチ!カービィ\n星のカービィ参上ドロッチェ団\n星のカービィウルトラスーパーデラックス\nあつめて!カービィ\nの４本がニンテンドーDS用ソフトとして発売されました。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "星のカービィ２５周年オーケストラコンサートは東名阪の３都市で開催された？",
  order: 4,
  is_yes: false,
  explanation: "東京と大阪の２都市で開催されました。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "ゲームボーイソフト「星のカービィ」の発売日は１９９３年４月２７日である？",
  order: 5,
  is_yes: false,
  explanation: "ゲームボーイ専用ソフトとして１９９２年４月２７日に発売されました。",
  quiz_id: quiz.id,
)

quiz = Quiz.create(
  title: "ポケモン図鑑クイズ",
  description: "全部分かればポケモン博士",
  user_id: user.id,
)
Question.create(
  sentence: "全国図鑑「No.50」のポケモンは「ピカチュウ」である",
  order: 1,
  is_yes: false,
  explanation: "「ピカチュウ」は全国図鑑「No.25」のポケモンです。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "ピカチュウの分類は「かみなりポケモン」である？",
  order: 2,
  is_yes: false,
  explanation: "ピカチュウの分類は「ねずみポケモン」です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "ピカチュウの高さは「0.4m」である？",
  order: 3,
  is_yes: true,
  explanation: "ピカチュウの高さは「0.4m」です。\n重さは「6.0kg」です。",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "ライチュウはアローラのすがたの方が高さも重さも小さい？",
  order: 4,
  is_yes: true,
  explanation: "ライチュウ：高さ「0.8m」重さ「30.0kg」\nアローラライチュウ：高さ「0.7m」重さ「21.0kg」",
  quiz_id: quiz.id,
)
Question.create(
  sentence: "ピチューの全国図鑑Noはピカチュウの図鑑「No.25」に\nカントーのポケモンの総数151を足した「176」より小さい？",
  order: 5,
  is_yes: true,
  explanation: "ピチューは全国図鑑「No.172」であり「176」より小さいです。",
  quiz_id: quiz.id,
)