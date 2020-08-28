# README
![Uploading furima-top.jpg…]()

# このアプリについて
- フリマサイトのクローン
- TECH::CAMP 80期短期集中メンバー4名にて作成
- 制作期間 2020/8/4 ~ 2020/8/25 (21日間)
- 使用Gemや機能、各担当箇所は以下に記載

# 制作メンバー
## hiromimatsu

### 実装内容
<img src=![Uploading 13DE1D4E-79EA-49D6-A3C0-E2C4500B5AB5_1_201_a.jpeg…](), width="70px", height="70px">

- DB設計
- 商品一覧ページ
- カテゴリー機能
- ユーザー新規登録、ログイン
- 商品編集ページ
- 商品詳細ページ
- 商品購入確認ページ

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique:true|
### Association
- has_many :items
- has_one :profile
- has_one: address
- has_one: credit

## profilesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|family_name|string|null: false|
|first_name_kana|string|null: false|
|family_name_kana|string|null: false|
|birthday|date|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user
 
## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|destination_first_name|string|null: false|
|destination_family_name|string|null: false|
|destination_first_name_kana|string|null: false|
|destination_family_name_kana|string|null: false|
|post_code|integer|null: false|
|prefecture|integer|null: false|
|city|string|null: false|
|house_number|integer|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## creditsテーブル
|Column|Type|Options|
|------|----|-------|
|credit_number|integer|null: false, unique: true|
|expiration_year|integer|null: false|
|expiration_month|integer|null: false|
|security_code|integer|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand_id|references|null: false, foreign_key: true|
|category_id|references|null: false, foreign_key: true|
|size_id|references|foreign_key: true|
|item_conditions_id|references|foreign_key: true|
|postage_pay_id|references|null: false, foreign_key: true|
|preparation_day_id|references|null: false,foreign_key: true|
|prefecture|integer||
|buyer_id|references|null: false, foreign_key: true|
|seller_id|references|null: false, foreign_key: true|
### Association
- has_many: item_images
- belongs_to: user
- belongs_to: category
- belongs_to: brand
- belongs_to_active_hash: size
- belongs_to_active_hash: item_condition
- belongs_to_active_hash: preparation_day
- belongs_to_active_hash: postage_payer

## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key|
### Association
- belongs_to: item

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
### Association
- has_many: items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: items