# before
!(https://gyazo.com/bf7703a6fc2163d20ebc8254b8585051)
# 概要
旅行に行く前に危険なところがわかり回避できる。
旅行中危険だったところを共有することができる。
国やタグごとに検索することができる。
投稿にコメントすることができる。
# 本番環境
https://before-35526.herokuapp.com/
ユーザー名：admin
パスワード：1111
# 制作背景
私は旅行が好きで何カ国か海外旅行に行ったことがあるのですが、そこで何度か嫌な体験や怖い体験しました。このアプリを通して事前にリスクを把握でき楽しむことができるように制作しました。
# DEMO
[![Image from Gyazo](https://i.gyazo.com/4659a3a9045992c16cb0cca90aef7842.gif)](https://gyazo.com/4659a3a9045992c16cb0cca90aef7842)
# 工夫したポイント
アクティブハッシュを使用し国を選択しているのでしっかりとデータが取れる。
危険度を可視化できるようにしたのでわかりやすい


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


