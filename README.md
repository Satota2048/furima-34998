# README

## user

| Column    | Type   | Options                   |
| --------- | ------ | ------------------------- |
| nickname  | string | null: false               |
| email     | string | null: false, unique: true |
| password  | string | null: false               |
| name      | string | null: false               |
| kana-name | string | null: false               |
| birth     | date   | null: false               |

### Association
- has_many :items

## items

| Column       | Type          | Options     |
| ------------ | ------------- | ----------- |
| image        | ActiveStorage | null: false |
| title        | string        | null: false |
| explain      | text          | null: false |
| category     | ActiveHash    | null: false |
| status       | ActiveHash    | null: false |
| how-much     | integer       | null: false |

## Association
- belongs_to :user
- has_one :buy-information

## buy-information

| Column       | Type          | Options     |
| ------------ | ------------- | ----------- |
| delivery-fee | ActiveHash    | null: false |
| send-from    | ActiveHash    | null: false |
| cost-days    | ActiveHash    | null: false |

## Association
- belongs_to :item
- has_one :send-address

## send-address

| Column        | Type          | Options     |
| ------------- | ------------- | ----------- |
| postal-number | string        | null: false | 
| prefectures   | ActiveHash    | null: false |
| municipality  | string        | null: false |
| address       | string        | null: false |
| building-name | string        | null: false |
| phone-number  | integer       | null: false|

## Association
- belongs_to :buy-information