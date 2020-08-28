# README

![furima-top](https://user-images.githubusercontent.com/67910543/91539600-8bc9bc00-e954-11ea-8d25-cf040901d288.jpg)

# このアプリについて
- フリマサイトのクローン
- TECH::CAMP 80期短期集中メンバー4名にて作成
- 制作期間 2020/8/4 ~ 2020/8/25 (21日間)
- 機能、各担当箇所は以下に記載

# 制作メンバー
## hiromimatsu
<img src= "https://user-images.githubusercontent.com/67910543/91537482-566f9f00-e951-11ea-966d-0531f62b768a.jpeg" width= "80">

### 実装内容

- DB設計
#### フロントエンド
- 商品詳細ページ
- 商品購入ページ
- 商品一覧ページ
#### バックエンド
- カテゴリー機能 （gem 'ancestry'）
- ユーザー新規登録、ログイン（ウィザード形式）
- 商品編集ページ （画像除く）
- 商品一覧ページ
- テストコード実装(ユーザー)

## ympon
<img src="https://user-images.githubusercontent.com/67910543/91537080-b154c680-e950-11ea-98f8-364967c48a17.jpg" width= "80">

### 実装内容
#### フロントエンド
- トップページ
#### バックエンド
- 商品出品時の複数画像投稿機能
- 商品詳細機能
- 商品編集機能（カテゴリー除く）


## tottiman
<img src="https://user-images.githubusercontent.com/67910543/91537072-aef26c80-e950-11ea-84c4-a1546c277032.jpg" width= "80">

### 実装内容
- DB設計
#### フロントエンド
- 新規登録/ログインページ
- マイページ
#### バックエンド
- クレジットカード決済機能

## shuheishuhei
<img src="https://user-images.githubusercontent.com/67910543/91542185-68087500-e958-11ea-8bc2-9e9f2682e2ce.jpeg" width= "80" height= "80">

### 実装内容
- デプロイ担当AWS EC2〜S3導入
- Nginx,Unicorn,Capistrano導入
- Basic認証
#### フロントエンド
- 商品出品ページ
#### バックエンド
- 商品出品機能(複数枚画像除く)
- 商品削除機能
- テストコード実装(商品出品)

### Gem一覧
- gem 'rails', '~> 6.0.0'
- gem 'mysql2', '>= 0.4.4'
- gem 'puma', '~> 3.11'
- gem 'sass-rails', '~> 5'
- gem 'webpacker', '~> 4.0'
- gem 'turbolinks', '~> 5'
- gem 'jbuilder', '~> 2.7'
- gem 'redis', '~> 4.0'
- gem 'bcrypt', '~> 3.1.7'
- gem 'image_processing', '~> 1.2'
- gem 'bootsnap', '>= 1.4.2', require: false 
- gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
- gem 'pry-rails'
- gem 'rspec-rails'
- gem 'capistrano'
- gem 'capistrano-rbenv'
- gem 'capistrano-bundler'
- gem 'capistrano-rails'
- gem 'capistrano3-unicorn'
- gem 'capistrano-rails-console'
- gem 'factory_bot_rails'
- gem 'web-console', '>= 3.3.0'
- gem 'listen', '>= 3.0.5', '< 3.2'
- gem 'spring'
- gem 'spring-watcher-listen', '~> 2.0.0'
- gem 'capybara', '>= 2.15'
- gem 'selenium-webdriver'
- gem 'webdrivers'
- gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
- gem 'unicorn'
- gem 'active_hash'
- gem 'devise'
- gem 'carrierwave'
- gem 'mini_magick'
- gem 'ancestry'
- gem 'jquery-rails'
- gem 'payjp'
- gem 'haml-rails'
- gem 'fog-aws' 
- gem 'font-awesome-sass'


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
