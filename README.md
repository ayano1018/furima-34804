# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nick_name       | string | null: false |
| email           | string | null: false, unique: true |
| password        | encrypted_password | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth           | date   | null: false |

### Association
- has_many :products dependent: :destroy
- has_one :address dependent: :destroy
- has_many :order_history dependent: :destroy



## address  テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| post_code       | string | null: false |
| region          | string | null: false |
| city            | string | null: false |
| address_number  | string | null: false |
| building_name   | string |             |
| phone_number    | string | null: false |
| user_id         | integer | null: false |

### Association
- belongs_to :user dependent: :destroy
- belong_to :oder_history dependent: :destroy
- belong_to :order_history

## product テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| name            | string | null: false |
| description     | text   | null: false |
| category        | string | null: false |
| condition       | integer | null: false |
| shipping_cost   | integer | null: false |
| region          | integer | null: false |
| shipping_days   | integer | null: false |
| price           | integer | null: false |


### Association
- belongs_to :user dependent: :destroy
- has_one :order_history dependent: :destroy
- has_one :address dependent: :destroy

## order_history テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| product_id      | references | null: false, foreign_key: true |
| user_id         | references | null: false, foreign_key: true |

- has_many :address dependent: :destroy
- belongs_to :product dependent: :destroy



