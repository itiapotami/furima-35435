# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| --------   | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| last_name  | string | null: false |
| first_name | string | null: false |
| last_kana  | string | null: false |
| first_kana | string | null: false |
| birthday   | date   | null:false  |


### Association

- has_many :items
- has_many :comments
- has_one  :purchase
- has_one  :address

## items テーブル

| Column      | Type       | Options     |
| ----------  | ---------- | ----------- |
| item_name   | string     | null: false |
| description | text       | null: false |
| category    | string     | null: false |
| status      | string     | null :false |
| fee         | string     | null :false |
| area        | string     | null :false |
| days        | string     | null :false |
| price       | integer    | null :false |
| user        | references |             |

### Association

- belongs_to :user
- has_many :comments
- has_one  :purchase

## comments テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| text      | text       | null: false |
| user      | references |             |
| items     | references |             |

### Association

- belongs_to :user
- belongs_to :item

## purchase

| Column        | Type       | Options         |
| ---------     | -------    | ----------------|
| card_number   | integer    | null :false     |
| expiration    | integer    | null :false     |
| security_code | integer    | null :false     |
| user          | references |                 |
| item          | references |                 |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses

| Column          | Type       | Options         |
|---------------  |------------|-----------------|
| postal_code     | string     | null :false     |
| prefecture      | string     | null :false     |
| city            | string     | null :false     |
| house_number    | string     | null :false     |
| building_number | string     |                 |
| phone_number    | integer    | null :false     |
| purchase        | references |                 |
| user            | references |                 |

### Association

- belongs_to :user
- belongs_to :purchase 

