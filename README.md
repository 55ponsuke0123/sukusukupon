# アプリケーション名
sukusukupon（すくすくぽん）

# アプリケーション概要
保育園や幼稚園での連絡帳（成長記録帳）

# URL
https://sukusukupon.herokuapp.com

# テスト用アカウント
（Basic認証）
ID:admin, Pass:2222
（ユーザー）
email:matsu@docomo.ne.jp, password:matsumatsu123

# 利用方法
新規登録後、画面下部中央の「入室する」をクリックし、必要事項を記入して送信する。新規登録が完了している場合は、画面右上の「ログインする」をクリックし、登録したメールアドレスとパスワードを入力後、画面下部中央の「入室する」をクリックして必要事項を記入し、送信する。

# 目指した課題解決
保育園や幼稚園を利用している家庭の毎朝の習慣を簡略化

# 洗い出した要件
優先度:3
機能:ActiveHash
目的:簡単な質問は記入ではなく選択制にすることで手間がかからないようにするため
詳細:朝食内容や保育士に伝えたいこと等は都度記入の必要があるが、その日の機嫌や体温、昨夜の睡眠状況などは簡単な質問で回答も限られているため、いちいち記入せずに選択できるようにする 
ユースケース:連絡帳を記入するのは主に朝の登園後で、親にとっては出勤前になるため、可能な限り素早く済ませられる工夫が必要である
所要時間:3h

優先度:2
機能:エラーメッセージは日本語
目的:必須事項に記入漏れがあった場合エラーメッセージが表示されるようにし、かつメッセージを的確に伝えるため
詳細:ユーザーの新規登録、ログイン時、連絡帳の出欠の記入に漏れがあった場合はエラーメッセージが表示されるようにし、かつメッセージは日本語に設定する
ユースケース:ユーザーのほとんどが日本人であることが想定されるため、英語は世界共通語ではあるが、今回は日本人を対象として日本人にわかりやすい表示を行う
所要時間:1h

優先度:1
機能:送信完了画面
目的:連絡帳の送信が無事終わったことを知らせるため
詳細:送信が完了したらトップページに戻るのではなく、送信を完了する画面に遷移し、送信完了を知らせるメッセージが表示されるようにする
ユースケース:連絡帳は家庭と保育園等の施設をつなぐ大事な情報交換ツールなので、記録に漏れがないようにする
所要時間:2h

# 実装した機能についての画像やGIF
右上に「ログインする」「新規登録する」という文字があり、それぞれをクリックして必要なページに遷移するようにする。利用には新規登録が必要である。
ユーザー登録が完了したら右上には「ログアウトする」の文字が表示され、「あつまれ！スクスク組さん！！」の「スクスク」という部分が登録したクラス名に変わる。また新規登録後（もしくはログイン後）は下部中央に「入室する」のボタンが表示されるので、ここをクリックして連絡帳のページへ遷移する。
必須事項は出欠のみだが、出席の場合と欠席の場合でそれぞれ質問項目がある（これら質問事項への回答は任意）。記入を終えて「送信する」のボタンをクリックすると、連絡帳が送信され送信完了ページが表示される。

<挙動確認動画>
1.新規登録
![movie1](https://user-images.githubusercontent.com/74514503/114265072-bcfd8500-9a29-11eb-9d5f-2cb50a275c6a.gif)

2.連絡帳記述〜送信
![movie2](https://user-images.githubusercontent.com/74514503/114265160-46ad5280-9a2a-11eb-89c5-2064dee63755.gif)

3.ログイン
![movie3](https://user-images.githubusercontent.com/74514503/114265211-8411e000-9a2a-11eb-9d87-1aa6a23b9551.gif)





# データベース設計

##  users テーブル
| Column        | Type       | Options       |
| ------------- | ---------- | ------------- |
| email         | string     | null: false   |
| password      | string     | null: false   |
| child_name    | string     | null: false   |
| classroom     | string     | null: false   |
| childminder1  | string     | null: false   |


### Association
has_many :books

## books テーブル
| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| presence_id          | integer    | null: false                    |
| mood_id              | integer    |                                |
| body_temperature_id  | integer    |                                |
| sleep_id             | integer    |                                |
| breakfast            | string     |                                |
| comment1             | text       |                                |   
| reason_id            | integer    |                                |
| period_id            | integer    |                                |
| comment2             | text       |                                |
| user                 | references | null: false, foreign_key: true |

### Association
belongs_to :user

# ローカルでの動作方法
1.git clone https://github.com/55ponsuke0123/sukusukupon.git
2.cd ~/projects
3.cd sukusukupon
4.bundle install
5.yarn install
6.rails db:create
7.rails db:migrate
8.rails s

ruby 2.6.5p114
Rails 6.0.3.5