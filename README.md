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
| birth             | date    | null:false |

### Association

- has_many :items
- has_many :purchases

## itemsテーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| title             | string     | null:false                   |
| explanation       | text       | null:false                   |
| category_id       | integer    | null:false                   |
| condition_id      | integer    | null:false                   |
| delivery_type_id  | integer    | null:false                   |
| delivery_day_id   | integer    | null:false                   |
| prefecture_id     | integer    | null:false                   |
| price             | integer    | null:false                   |
| user              | references | foreign_key:true, null:false |

### Association

- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_type
- belongs_to_active_hash :delivery_day
- belongs_to_active_hash :prefecture

## purchasesテーブル

| Column            | Type       | Options                      |
| ----------------- | ---------- | ---------------------------- |
| user              | references | foreign_key:true, null:false |
| item              | references | foreign_key:true, null:false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer_info

## buyer_infoテーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| postal_code        | string     | null:false                   |
| prefecture_id      | integer    | null:false                   |
| city               | string     | null:false                   |
| address_line       | string     | null:false                   |
| building_name      | string     |                              |
| phone_num          | string     | null:false                   |
| purchase           | references | foreign_key:true, null:false | 

### Association

- belongs_to :purchase
- belongs_to_active_hash :prefecture