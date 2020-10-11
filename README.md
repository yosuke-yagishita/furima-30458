# テーブル設計

## usersテーブル

| Column            | Type    | Options    |
| ----------------- | ------- | ---------- |
| nickname          | string  | null:false |
| email             | string  | null:false |
| password          | string  | null:false |
| family_name_kanji | string  | null:false |
| first_name_kanji  | string  | null:false |
| family_name_kana  | string  | null:false |
| first_name_kana   | string  | null:false |
| birth_year        | integer | null:false |
| birth_month       | integer | null:false |
| birth_day         | integer | null:false |

### Association

- has_many :items
- has_many :comments
- has_many :transactions

## itemsテーブル

| Column            | Type       | Options            |
| ----------------- | ---------- | ------------------ |
| image             |            | ActiveStorageで実装 |
| title             | string     | null:false         |
| explanation       | text       | null:false         |
| category_id     | integer    | null:false         |
| condition_id      | integer    | null:false         |
| delivery_type_id  | integer    | null:false         |
| delivery_day_id  | integer    | null:false         |
| prefecture_id    | integer    | null:false         |
| price             | integer    | null:false         |
| user_id           | references |                    |

### Association

- belongs_to :user
- has_many :comments
- has_one :transaction
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_type
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :prefecture

## transactionsテーブル

| Column            | Type       | Options |
| ----------------- | ---------- | ------- |
| user_id           | references |         |
| item_id           | references |         |
| buyer_info_id     | references |         |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buyer_info

## buyer_infoテーブル

| Column           | Type    | Options    |
| ---------------- | ------- | ---------- |
| card_num         | text    | null:false |
| expiration_month | integer | null:false |
| expiration_year  | integer | null:false |
| security_code    | integer | null:false |
| postal_code      | string  | null:false |
| prefectures_id   | integer | null:false |
| city             | string  | null:false |
| address_line1    | string  | null:false |
| address_line2    | string  | null:false |
| phone_num        | integer | null:false |

### Association

- has_one :transaction
- belongs_to_active_hash :prefectures

## commentsテーブル

| Column            | Type       | Options   |
| ----------------- | ---------- | --------- |
| text              | text       | nul:false |
| user_id           | references |           |
| item_id           | references |           |

### Association
- belongs_to :user
- belongs_to :item