# README

![Uploading furima-top.jpg…]()

# このアプリについて
- フリマサイトのクローン
- TECH::CAMP 80期短期集中メンバー4名にて作成
- 制作期間 2020/8/4 ~ 2020/8/25 (21日間)
- 機能、各担当箇所は以下に記載

# 制作メンバー
## hiromimatsu

### 実装内容

- DB設計
フロントエンド
- 商品詳細ページ
- 商品購入ページ
- 商品一覧ページ
バッグエンド
- カテゴリー機能 （gem 'ancestry'）
- ユーザー新規登録、ログイン（ウィザード形式）
- 商品編集ページ （画像除く）
- 商品一覧ページ

## ympon
<img src="https://files.slack.com/files-pri/TBRRYLL4Q-F019NK2SNHG/ios__________.jpg" width=10%>

### 実装内容
フロントエンド
- トップページ
バックエンド
- 商品出品時の複数画像投稿機能
- 商品詳細機能
- 商品編集機能（カテゴリー除く）

## tottiman
<img src="https://files.slack.com/files-tmb/TBRRYLL4Q-F0197SE3A8P-f497300913/toshiki-no-pic________________720.jpg" width=10%>

### 実装内容
- DB設計
フロントエンド
- 新規登録/ログインページ
- マイページ
バックエンド
- クレジットカード決済機能

## shuheishuhei

### 実装内容

# サイトURL (Basic認証キー)
- ユーザー名: shuhei
- パスワード: shuhei0331

# テスト用アカウント等
## 購入者用
- メールアドレス: buyer_user@gmail.com
- パスワード: buyer_user
## 購入用カード情報
- 番号：4242424242424242
- 期限：08/25
- セキュリティコード：456
## 出品者用
- メールアドレス名: seller_user@gmail.com
- パスワード: seller_user


# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false,uniqueness: true|
|email|string|null: false, unique: true|
|password|string|null: false|
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
|phone_number|string|unique: true|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false|
|card_id|string|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|price|integer|null: false|
|brand|string||
|category_id|references|null: false, foreign_key: true|
|condition_id|references|null: false|
|prefecture_id|integer|null: false|
|day_id|integer|null: false|
|postage_id|references|null: false|
|way_id|integer|null: false|
|status_id|integer|null: false|
### Association
- has_many: item_images
- belongs_to: user
- belongs_to: category
- belongs_to: brand
- belongs_to_active_hash: prefecture
- belongs_to_active_hash: condition
- belongs_to_active_hash: postage
- belongs_to_active_hash: day
- belongs_to_active_hash: way
- belongs_to_active_hash: status

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
- has_ancestry
- has_many: items