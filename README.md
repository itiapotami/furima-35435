# テーブル設計

## users テーブル

| Column               | Type   | Options                  |
| --------             | ------ | ------------------------ |
| nickname             | string | null: false              |
| email                | string | null: false  unique:true |
| encrypted_password   | string | null: false              |
| last_name            | string | null: false              | 
| first_name           | string | null: false              |
| last_kana            | string | null: false              |
| first_kana           | string | null: false              |
| birthday             | date   | null: false              |


### Association

- has_many :items
- has_many :comments
- has_many  :purchases


## items テーブル

| Column         | Type       | Options              |
| ----------     | ---------- | ---------------      |
| item_name      | string     | null: false          |
| description    | text       | null: false          |
| category_id    | integer    | null: false          |
| status_id      | integer    | null :false          |
| fee_id         | integer    | null :false          |
| prefecture_id  | integer    | null :false          |
| day_id        | integer    | null :false          |
| price          | integer    | null :false          |
| user           | references | foreign_key :true    |

### Association

- belongs_to :user
- has_many :comments
- has_one  :purchase

## comments テーブル

| Column    | Type       | Options           |  
| --------- | ---------- | -----------       |
| text      | text       | null: false       |
| user      | references | foreign_key :true |
| items     | references | foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item

## purchase

| Column        | Type       | Options           |
| ---------     | -------    | ----------------  |
| user          | references | foreign_key :true |
| item          | references | foreign_key :true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column          | Type       | Options           |
|---------------  |------------|-----------------  |
| postal_code     | string     | null :false       |
| prefecture_id   | integer    | null :false       |
| city            | string     | null :false        |
| house_number    | string     | null :false       |
| building_number | string     |                   |
| phone_number    | string     | null :false       |
| purchase        | references | foreign_key :true |


### Association


- belongs_to :purchase 

