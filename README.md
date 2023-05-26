# DB 設計

## users table

| Column             | Type                | Options                   |
|--------------------|---------------------|---------------------------|
| nickname           | string              | null: false               |
| email              | string              | null: false, unique: true |
| encrypted_password | string              | null: false               |
| last_name          | string              | null: false               |
| first_name         | string              | null: false               |
| last_name_kana     | string              | null: false               |
| first_name_kana    | string              | null: false               |
| birthday           | date                | null: false               |





### Association

* has_many :items
* has_many :histories

## items table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item_name                           | string     | null: false                    |
| catch_copy                          | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |
| category_id                         | integer    | null: false                    |
| condition_id                        | integer    | null: false                    |
| okuru_id                             | integer    | null: false                    |
| place_id                            | integer    | null: false                    |
| period_id                           | integer    | null: false                    |
| price                               | integer    | null: false                    |


### Association

- belongs_to :user
- has_one :history

## histories table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :order




## orders table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| history                             | references | null: false, foreign_key: true |
| post_code                           | string     | null: false                    |
| place_id                            | integer    | null: false                    |
| city                                | string     | null: false                    |
| banti                               | string     | null: false                    |
| building_name                       | string     |                                |
| tel                                 | string     | null: false                    |

### Association

- belongs_to :history
