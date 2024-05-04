# テーブル設計

## users テーブル

| Column           | Type   | Options                   |
| ---------------- | ------ | ------------------------- |
| nickname         | string | null: false               |
| email            | string | null: false, unique: true |
| password         | string | null: false               |
| family_name      | string | null: false               |
| first_name       | string | null: false               |
| family_reading   | string | null: false               |
| first_reading    | string | null: false               |
| year             | eunm   | null: false               |
| month            | eunm   | null: false               |
| day              | eunm   | null: false               |

### Association

- has_many :items
- has_many :orders
- has_many :addresses



## items テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| image     | blob       | null: false                    |
| title     | string     | null: false                    |
| text      | text       | null: false                    |
| category  | enum       | null: false                    |
| condition | enum       | null: false                    |
| shipping  | enum       | null: false                    |
| region    | enum       | null: false                    |
| date      | enum       | null: false                    |
| price     | decimal    | null: false                    |
| fee       | decimal    | null: false                    |
| profit    | decimal    | null: false                    |
| user_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- belongs_to :address



## order テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- belongs_to :address



## addresses

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postcode   | char       | null: false                    |
| prefecture | enum       | null: false                    |
| city       | string     | null: false                    
| house_unm  | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
| order_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- belongs_to :address