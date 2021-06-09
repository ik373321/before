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


