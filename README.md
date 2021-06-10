# before
[![Image from Gyazo](https://i.gyazo.com/e72f3940bb52b68b94e87c11a721bbf7.gif)](https://gyazo.com/e72f3940bb52b68b94e87c11a721bbf7)

# 概要
旅行に行く前に危険なところがわかり回避できる。
旅行中危険だったところを共有することができる。
国やタグごとに検索することができる。
投稿にコメントすることができる。
# 本番環境
- http://52.68.59.8/
- ユーザー名：admin
- パスワード：1111
# 制作背景
私は旅行が好きで何カ国か海外旅行に行ったことがあるのですが、
そこで何度か嫌な体験や怖い体験しました。
<br>
事前にリスクを把握でき旅行を楽しむことができるようなアプリを制作したいと考えました。
# DEMO


# 工夫したポイント
### アクティブハッシュで国名を取得
- アクティブハッシュを使用し国を選択できるようにしました。
- そうすることで、例えばアメリカの投稿をする時に投稿者が「アメリカ」「アメリカ合衆国」「USA」「米国」と同じ意味でも別の単語を使うと検索や表示の際に手間がなくなります。
### 危険度の可視化
- 危険度を星1から星10まで選べるようにしました。
- それにより、ユーザーがパッとみた時にどのくらいの危険度なのかわかりやすくしました。
### 地図を挿入
- Maps JavaScript APIやService Usage APIを活用し地図を挿入しました。
- その結果、投稿者が投稿していた場所をすぐに確認することができます。

# 使用技術（開発環境）
- 言語： HTML/CSS/JavaScript/Ruby
- フレームワーク: Ruby on Rails
- データベース: MySQL/MariaDB
- インフラ: AWS（EC2）
- テストツール: RSpec
- コードレビュー： Rubocop
- デプロイ:Capistrano
- API:Google map API(Maps JavaScript API/Service Usage API)
- その他環境構築: Docker

# 課題や今後実装したい機能
投稿時に危険な場所をmapにピン留めし、投稿一覧で危険な場所がピン留めされているのですぐにわかる機能


# DB設計
## users　テーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| nickname           | string | null: false              | ニックネーム
| email              | string | unique:true, null: false | メールアドレス
| encrypted_password | string | null: false              | パスワード

### Association
- has_many :tweets
- has_many :comments

## tweets テーブル

| Column             | Type       | Options                        |
|--------------------|------------|--------------------------------|
| title              | string     | null: false                    | タイトル
| risk_id            | integer    | null: false                    | 危険度　アクティブハッシュ
| country_id         | integer    | null: false                    | 国　アクティブハッシュ
| city               | string     |                                | 地域
| block              | text       | null: false                    | 場所
| year               | string     | null: false                    | 年
| month              | string     | null: false                    | 月
| day_id             | integer    | null: false                    | 朝昼晩　アクティブハッシュ
| time               | text       |                                | 時間
| detail             | text       | null: false                    | 内容説明
| user_id            | references | null: false, foreign_key: true |

### Association
- has_many   :comments
- has_many   :tweet_tags
- belongs_to :user





## tweet_tags テーブル

| Column    | Type       | Options                        |
|-----------|------------|--------------------------------|
| tag_id    | references | null: false, foreign_key: true |
| tweet_id  | references | null: false, foreign_key: true |

### Association
- belongs_to :tweet
- belongs_to :tag



## tags テーブル

| Column             | Type   | Options                  |
|--------------------|--------|--------------------------|
| name               | string | null: false              | タグ名

### Association
- has_many   :tweet_tags




## comments テーブル

| Column   | Type       | Options                        |
|----------|------------|--------------------------------|
| text     | string     | null: false                    | コメント
| user_id  | references | null: false, foreign_key: true |
| tweet_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet


