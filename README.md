## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association
- has_many :cans
- has_many :comments


## cans テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| active_id   | integer    | null: false       |
| place_id    | integer    | null: false       |
| set_time_id | integer    | null: false       |
| description | text       | null: false       |
| image       |            |                   |
| user_id     | references | foreign_key: true |

## Association
- belongs_to :user
- has_many :comments


## comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user_id | references | foreign_key: true |
| can_id  | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :can
