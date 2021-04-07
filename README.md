# README

## users

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| last_name          | string | null: false               |
| family_kana_name   | string | null: false               |
| last_kana_name     | string | null:false                |
| birth              | date   | null: false               |

### Association
- has_many :items
- has_many :user_judges

## items

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| title           | string        | null: false                    |
| explain         | text          | null: false                    |
| category_id     | integer       | null: false                    |
| status_id       | integer       | null: false                    |
| how_much        | integer       | null: false                    |
| delivery_fee_id | integer       | null: false                    |
| send_from_id    | integer       | null: false                    |
| cost_day_id     | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :user_judge

## user_judges

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :item
- has_one :send_address

## send_addresses

| Column        | Type          | Options                        |
| ------------- | ------------- | ------------------------------ |
| postal_number | string        | null: false                    | 
| prefecture_id | integer       | null: false                    |
| municipality  | string        | null: false                    |
| address       | string        | null: false                    |
| building_name | string        |                                |
| phone_number  | string        | null: false                    |
| user_judge    | references    | null: false, foreign_key: true |

## Association
- belongs_to :user_judge