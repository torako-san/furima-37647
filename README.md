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
- has_many :addresses

## addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| post_code             | string     | null: false                    |
| city                  | string     | null: false                    |
| address_line          | string     | null: false                    |
| phone_number          | string     | null: false                    |
| region                | references | null: false, foreign_key: true |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| users   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | text       | null: false                    |
| price                | integer    | null: false                    |
| item_category        | references | null: false, foreign_key: true |
| item_status          | references | null: false, foreign_key: true | 
| delivery_burden      | references | null: false, foreign_key: true |
| delivery_area        | references | null: false, foreign_key: true |
| delivery_day         | references | null: false, foreign_key: true |

### Association

- has_one :order
- belongs_to :user