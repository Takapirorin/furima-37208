# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_ name        | string | null: false |
| family_name_kana   | string | null: false |
| first_ name_kana   | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :items
- has_many :purchases
- has_many :shippings
- has_many :comments

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| product_name | text       | null: false                    |
| explanation  | text       | null: false                    |
| detail       | string     | null: false                    |
| delivery     | string     | null: false                    |
| price        | string     | null: false                    |
| user         | references | null: false, foreign_key: true |

### Association

- has_many :comments
- has_many :purchases
- belongs_to :user

## purchases テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shippings テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| purchase      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :purchases

## comments
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | text       | null: false                    |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item