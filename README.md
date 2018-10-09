# README

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|mail|string|null: false, unique: true|
|password|string|null: false|
|icon|string||
### Association
- has_many :reservations, dependent: :destroy
- has_many :likes, dependent: :destroy

## reservationsテーブル
|Column|Type|Options|
|------|----|-------|
|day|date|null: false|
|reservation_hours_id|integer|references :reservation_hours, foreign_key: true, index: true|
|user_id|integer|references :user, foreign_key: true, index: true|
|space_id|integer|references :space, foreign_key: true, index: true|
### Association
- belongs_to :user
- belongs_to :reservation_hours, dependent: :destroy
- belongs_to :space

## reservation_hoursテーブル
|Column|Type|Options|
|------|----|-------|
|zero|integer|null: false|
|one|integer|null: false|
|two|integer|null: false|
|three|integer|null: false|
|four|integer|null: false|
|five|integer|null: false|
|six|integer|null: false|
|seven|integer|null: false|
|eight|integer|null: false|
|nine|integer|null: false|
|ten|integer|null: false|
|eleven|integer|null: false|
|twelve|integer|null: false|
|thirteen|integer|null: false|
|fourteen|integer|null: false|
|fifteen|integer|null: false|
|sixteen|integer|null: false|
|seventeen|integer|null: false|
|eighteen|integer|null: false|
|nineteen|integer|null: false|
|twenty|integer|null: false|
|twenty_one|integer|null: false|
|twenty_two|integer|null: false|
|twenty_three|integer|null: false|
### Association
- belongs_to :reservation

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|references :user, foreign_key: true, index: true|
|space_id|integer|references :space, foreign_key: true, index: true|
### Association
- belongs_to :user
- belongs_to :space, counter_cache: true

## spacesテーブル
|Column|Type|Options|
|------|----|-------|
|likes_count|integer||
|host_id|integer|references :host, foreign_key: true, index: true|
|equipment_info_id|integer|references :equipment_info, foreign_key: true, index: true|
|basic_info_id|integer|references :basic_info, foreign_key: true, index: true|
|description_id|integer|references :description, foreign_key: true, index: true|
|plan_id|integer|references :plan, foreign_key: true, index: true|
|image_id|integer|references :image, foreign_key: true, index: true|
### Association
- belongs_to :host
- belongs_to :equipment_info, dependent: :destroy
- belongs_to :basic_info, dependent: :destroy
- belongs_to :description, dependent: :destroy
- belongs_to :plan, dependent: :destroy
- has_many   :images, dependent: :destroy
- has_many   :likes, dependent: :destroy
- has_many   :reservations, dependent: :destroy

## hostsテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|mail|string|null: false, unique: true|
|phone_number|integer|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :spaces, dependent: :destroy

## equipment_infosテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture|string|null: false|
|city_name|string|null: false|
|street_name|string|null: false|
|building_name|string||
|latitude|float|null: false|
|longitude|float|null: false|
|access|text||
|phone_number|integer|null: false|
|equipment_type|integer(enum)|null: false|
### Association
- belongs_to :space

## basic_infosテーブル
|Column|Type|Options|
|------|----|-------|
|capacity|integer|null: false|
|floor_space|integer|null: false|
|date_of_starting_reception|integer(enum)|null: false|
|passig_key_method|integer(enum)|null: false|
|deadline_of_reservation|integer(enum)|null: false|
|purpose_id|integer|references :purpose, foreign_key: true, index: true|
### Association
- belongs_to :space
- belongs_to :purpose, dependent: :destroy

## purposesテーブル
|Column|Type|Options|
|------|----|-------|
|party|integer|null: false|
|class|integer|null: false|
|photo_shoot|integer|null: false|
|film_shoot|integer|null: false|
|event|integer|null: false|
|performance|integer|null: false|
|studio|integer|null: false|
|sports|integer|null: false|
|office|integer|null: false|
|wedding|integer|null: false|
|other|integer|null: false|
### Association
- belongs_to :basic_info

## descriptionsテーブル
|Column|Type|Options|
|------|----|-------|
|catch_copy|string|null: false|
|overview|text|null: false|
|about_facilities|text|null: false|
### Association
- belongs_to :space

## plansテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|about_plan|text||
|price_per_hour|integer|null: false|
|price_per_day|integer|null: false|
|reservation_approval_method|integer(enum)|null: false|
|rental_day_id|integer|null: false, index: true|
|rental_hour_id|integer|null: false, index: true|
### Association
- belongs_to :space
- belongs_to :rental_day, dependent: :destroy
- belongs_to :rental_hour, dependent: :destroy

## rental_daysテーブル
|Column|Type|Options|
|------|----|-------|
|sunday|integer|null: false|
|monday|integer|null: false|
|tuesday|integer|null: false|
|wednesday|integer|null: false|
|thursday|integer|null: false|
|friday|integer|null: false|
|saturday|integer|null: false|
### Association
- belongs_to :plan

## rental_hoursテーブル
|Column|Type|Options|
|------|----|-------|
|zero|integer|null: false|
|one|integer|null: false|
|two|integer|null: false|
|three|integer|null: false|
|four|integer|null: false|
|five|integer|null: false|
|six|integer|null: false|
|seven|integer|null: false|
|eight|integer|null: false|
|nine|integer|null: false|
|ten|integer|null: false|
|eleven|integer|null: false|
|twelve|integer|null: false|
|thirteen|integer|null: false|
|fourteen|integer|null: false|
|fifteen|integer|null: false|
|sixteen|integer|null: false|
|seventeen|integer|null: false|
|eighteen|integer|null: false|
|nineteen|integer|null: false|
|twenty|integer|null: false|
|twenty_one|integer|null: false|
|twenty_two|integer|null: false|
|twenty_three|integer|null: false|
### Association
- belongs_to :plan
