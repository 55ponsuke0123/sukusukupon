# テーブル設計

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
