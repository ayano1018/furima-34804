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
| encrypted_password | string  | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birth           | date   | null: false |

### Association
- has_many :products dependent: :destroy
- has_many :order_histories dependent: :destroy



## addresses  テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| post_code       | string | null: false |
| region_id       | integer | null: false |
| city            | string | null: false |
| address_number  | string | null: false |
| building_name   | string |             |
| phone_number    | string | null: false |
| order_history   | references | null: false, foreign_key: true |

### Association
- belong_to :oder_history 


## products テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| description        | text   | null: false |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_cost_id   | integer | null: false |
| region_id          | integer | null: false |
| shipping_day_id    | integer | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true｜


### Association
- belongs_to :user 
- has_one :order_history dependent: :destroy


## order テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| product      | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

- has_one :address dependent: :destroy
- belongs_to :product 
- belongs_to :user 



