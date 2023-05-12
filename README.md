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

* has_one :item
* has_one :comments
* has_one :orders

## item table

| Column                              | Type       | Options                        |
|-------------------------------------|------------|--------------------------------|
| itemname                            | string     | null: false                    |
| catch_copy                          | text       | null: false                    |
| user                                | references | null: false, foreign_key: true |
| category                            | string     | null: false                    |
| condition                           | string     | null: false                    |
| send                                | string     | null: false                    |
| place                               | string     | null: false,                   |
| day                                 | string     | null: false                    |
| price                               | integer    | null: false,                   |


### Association

- belongs_to :user
- has_one :comments

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
| itemname                            | string     | null: false                    |
| user                                | references | null: false, foreign_key: true |
| place1                              | string     | null: false                    |
| place2                              | string     | null: false                    |
| place3                              | string     | null: false                    |
| place4                              | string     | null: false                    |
| tel                                 | string     | null: false                    |
### Association

- belongs_to :user
- has_one :comments
