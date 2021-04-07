# README

## user

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
- has_many :user_judge

## items

| Column          | Type          | Options                        |
| --------------- | ------------- | ------------------------------ |
| title           | string        | null: false                    |
| explain         | text          | null: false                    |
| category.id     | integer       | null: false                    |
| status.id       | integer       | null: false                    |
| how_much        | integer       | null: false                    |
| delivery_fee.id | integer       | null: false                    |
| send_from.id    | integer       | null: false                    |
| cost_day.id     | integer       | null: false                    |
| user            | references    | null: false, foreign_key: true |

## Association
- belongs_to :user
- has_one :user_judge

## user_judge

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| items  | references | null: false, foreign_key: true |

## Association
- belongs_to :user
- belongs_to :items
- has_one :send_address

## send_address

| Column        | Type          | Options     |
| ------------- | ------------- | ----------- |
| postal_number | string        | null: false | 
| prefecture.id | integer       | null: false |
| municipality  | string        | null: false |
| address       | string        | null: false |
| building-name | string        | null: false |
| phone_number  | string        | null: false |

## Association
- belongs_to :user_judge