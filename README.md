# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| first_name         | string | null: false               |
| family_reading     | string | null: false               |
| first_reading      | string | null: false               |
| birthday           | date   | null: false               |


### Association

- has_many :items
- has_many :orders



## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| title        | string     | null: false                    |
| text         | text       | null: false                    |
| category_id  | integer    | null: false                    |
| condition_id | integer    | null: false                    |
| shipping_id  | integer    | null: false                    |
| region_id    | integer    | null: false                    |
| date_id      | integer    | null: false                    |
| price        | decimal    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order



## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address



## addresses テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| postcode   | string     | null: false                    |
| region_id  | integer    | null: false                    |
| city       | string     | null: false                    
| house_unm  | string     | null: false                    |
| building   | string     |                                |
| phone      | string     | null: false                    |
| order      | references | null: false, foreign_key: true |

### Association

- belongs_to :order

