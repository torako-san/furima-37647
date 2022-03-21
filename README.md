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
| birthday                    | date   | null: false               |

### Association

- has_many :items
- has_many :orders

## addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| delivery_area_id      | integer    | null: false                    |
| city                  | string     | null: false                    |
| address_line          | string     | null: false                    |
| address_building      | string     |                                |
| phone_number          | integer    | null: false                    |

### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| address   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| price                | integer    | null: false                    |
| item_category_id     | integer    | null: false                    |
| item_status_id       | integer    | null: false                    |
| delivery_burden_id   | integer    | null: false                    |
| delivery_area_id     | integer    | null: false                    |
| delivery_day_id      | integer    | null: false                    |
| user                 | integer    | null: false                    |

### Association

- has_one :order
- belongs_to :user