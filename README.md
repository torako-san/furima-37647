# データベース設計

## users テーブル

| Column                      | Type   | Options                   |
| --------------------------- | ------ | ------------------------- |
| nickname                    | string | null: false               |
| email                       | string | null: false, unique: true |
| encrypted_password          | string | null: false               |
| family_name                 | string | null: false               |
| given_name                  | string | null: false               |
| family_name_katakana        | string | null: false               |
| given_name_katakana         | string | null: false               |
| birth_year                  | string | null: false               |
| birth_month                 | string | null: false               |
| birth_day                   | string | null: false               |

### Association

- has_many :items
- has_many :orders

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| users   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- has_many :orders
- belongs_to :user
- has_one_attached  :image
- belongs_to :item_category
- belongs_to :item_status
- belongs_to :delivery_burden
- belongs_to :delivery_area
- belongs_to :delivery_day
