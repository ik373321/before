# before
[![Image from Gyazo](https://i.gyazo.com/e72f3940bb52b68b94e87c11a721bbf7.gif)](https://gyazo.com/e72f3940bb52b68b94e87c11a721bbf7)

# 概要
- このアプリは旅行前に使用します。
- 旅行先でのリスクを事前に把握することができます。
- ユーザは主に投稿・閲覧・コメントをすることができます。
- 国・タグの検索や地域ごとで投稿を表示しているのでユーザーはスピード感を持って閲覧できます。
# 本番環境
- http://52.68.59.8/
- ユーザー名：admin
- パスワード：1111
# 制作背景
私は旅行が好きで何カ国か海外旅行に行ったことがあります。
<br>
その時に何度か嫌な体験や怖い体験しました。
<br>
事前にそのようなことがわかっていれば、避けられたリスクもあったと思います。
<br>
そこで、事前にリスクを把握でき旅行を楽しむことができるようなアプリを制作しました。
# 要件定義
|機能|目的|詳細|
|-|---|----|
| ユーザー新規登録機能 | ログアウト状態の人と権限を変えるため | ニックネーム/メールアドレス/パスワードを入力すると登録できる |
| ユーザーログイン機能 | 何度も新規登録をする必要をなくすため | 登録しているメールアドレスとパスワードを入力するとログインできる |
| 投稿機能 | 自分が体験した情報を共有するため | タイトル/危険度/国/地域/具体的な場所/年/月/時間帯/内容/タグを入力すると投稿することができる |
| 投稿削除機能 | 消したくなった投稿を削除するため | 投稿者のみ削除ができる |
| 投稿編集機能 | 投稿を編集できるようにするため | 投稿者のみ編集ができる |
| コメント機能 | 投稿者と直接コミュニケーションを取れるようにするため | ログイン中のユーザーのみに各投稿でコメントすることができる |
| タグ検索機能 | キーワードごとに投稿を確認できるようにするため | タグ一覧からタグを見つけることができ、そのタグを押すとタグごとの投稿一覧が表示され閲覧できる |
| 国検索機能 | 国ごとに投稿を確認できるようにするため | 国を検索することができ、その国の投稿一覧を閲覧できる |
| 地図表示機能 | 投稿者が投稿した場所をよりイメージしやすくするため | 投稿画面と詳細画面で地図を表示しているので投稿する時には思い出しやすく、閲覧時にはイメージしやすくできる |
| 地域別表示機能 | 地域ごとに表示することでその地域の全体像をつかめるようにするため | アジア/アフリカ/ヨーロッパ/北アメリカ/南アメリカ/オセアニアの6地域ごとに表示されているので地域の全体像をつかめるようになる |







# DEMO
### 投稿画面
[![Image from Gyazo](https://i.gyazo.com/9ab45ee0de5756c6c999c8e53d1e88a4.gif)](https://gyazo.com/9ab45ee0de5756c6c999c8e53d1e88a4)
### コメント画面
[![Image from Gyazo](https://i.gyazo.com/38b71fadb29d5b63c38eea63af2f6b49.gif)](https://gyazo.com/38b71fadb29d5b63c38eea63af2f6b49)
### 地域ごとに表示
[![Image from Gyazo](https://i.gyazo.com/968c6e543eb8ab31b0dc5f6ad888c867.gif)](https://gyazo.com/968c6e543eb8ab31b0dc5f6ad888c867)
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

# ER図
[![Image from Gyazo](https://i.gyazo.com/34621f9210948f2d26d9f81b00aededa.png)](https://gyazo.com/34621f9210948f2d26d9f81b00aededa)

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


