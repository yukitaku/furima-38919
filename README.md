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

* has_many :item
* has_many :comments
* has_many :orders

## item table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| name                                | string     | null: false                    |
| catch_copy                          | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |
| category                            | string     | null: false                    |
| condition                           | string     | null: false                    |
| send                                | string     | null: false                    |
| place                               | string     | null: false,                   |
| peri                                | string     | null: false                    |
| price                               | integer    | null: false,                   |


### Association

- belongs_to :user
- has_many :comments

## comments table

| Column      | Type       | Options                        |
|-------------|------------|--------------------------------|
| content     | text       | null: false                    |
| item        | references | null: false, foreign_key: true |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- belongs_to :orders




## orders table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| item                                | references | null: false, foreign_key: true |
| user                                | references | null: false, foreign_key: true |
| card number                         | string     | null: false                    |
| date of expiry                      | date       | null: false                    |
| security                            | string     | null: false                    |
| post                                | string     | null: false                    |
| place1                              | string     | null: false                    |
| place2                              | string     | null: false                    |
| place3                              | string     | null: false                    |
| place4                              | string     | null: false                    |
| tel                                 | string     | null: false                    |
### Association

- belongs_to :user
- has_many :comments