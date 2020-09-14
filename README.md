# README
 ## アプリ名
  - TeamsCommit
 ## 本番環境
 - URL:   https://teams-commit.herokuapp.com/

 - テストアカウント
 <br>email: user@user15.com
 <br> pass:  44445555

## 制作背景
-  プログラミングスクールに通う人達同士でもっと情報交換などを行う場所があれば、更に有意義な
時間を過ごすことが出来るのではないかと考えた為、このアプリを制作しました。
私が学んだTECHCAMPでのカリキュラムは個人での学習になりますが、チームに分かれて
毎日アウトプットを行う時間があります。そこでは、今まで自分の周りにはいなかった、経験をされている方や、独学でプログラミングを学習されている方などの様々な話しを聞くことが出来ました。又、各自で学習を進めていて、気づいたことなどを共有したりもしました。そこで私は、もっと頻繁に情報交換やコミュニケーションがとれるようなツールがあればいいなと考えました。

## 工夫したポイント
実際に使いたくなるような物を作りたかったので、まずは見た目にこだわりました。1つの投稿がちゃんと記事のようになるように作成しました。又、ユーザーが使い易くする為、いいね機能やコメント機能は非同期通信を取り入れました。


## 開発環境
- HTML/ CSS / JavaScript / jquery / Ruby /  Ruby on Rails 

## アプリ機能<br>
## １、ユーザー登録、ログイン

<p>
  <img width="200" alt="新規登録" src="https://user-images.githubusercontent.com/67737399/92548867-0a96f100-f293-11ea-9a6d-ebcf163b02fb.png">
</p>
<p>
  <img width="200" alt="ログイン" src="https://user-images.githubusercontent.com/67737399/92550498-8f373e80-f296-11ea-86f0-0803d4179c69.png">
</p>

##  ２、グループ作成
<p>
  <img width = "200" alt= 
  "グループ作成" src= "https://user-images.githubusercontent.com/67737399/92550656-fe149780-f296-11ea-9608-9fb527a42f70.jpg">
</p>

## 3、投稿
共有したい内容や記事URL、画像などを投稿することが出来ます。
<p>
<img width= "200px" alt= "投稿" src= "https://user-images.githubusercontent.com/67737399/92550980-e4c01b00-f297-11ea-8087-6f54fd9cda34.jpg">
</p>

## 4,投稿一覧
グループで投稿した記事が全て表示されています。<br>下から順に新しい記事が投稿されます。詳細、削除、いいね機能がついています。
<p>
<img width= "200px" alt= "投稿一覧" src= "https://user-images.githubusercontent.com/67737399/92551056-0de0ab80-f298-11ea-81c8-ee1523e69da0.jpg">

## 5、投稿詳細
投稿の詳細ページでは、記事の内容を見ることが出来き、URLが貼ってあればリンクに飛ぶことができます。<br>又、コメント機能があります。
<p>
<img width= "200px" alt= "投稿詳細" src= "https://user-images.githubusercontent.com/67737399/92551160-4f715680-f298-11ea-8e1e-be7aaabaf589.jpg">
</p>

## 実装予定
 - ランキング機能
 - Vue.jsを使用した非同期通信、UIの実装



# DB設計
## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|integer|null: false|

### Association
- has_many :posts
- has_many :likes
- has_many :liked_posts, through: :likes, source: :post
- has_many :group_users
- has_many :groups, through: :group_users
- has_many :comments



## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :group_users
- has_many :users, through: :group_users
- has_many :posts


## postsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|||
|text|text|||
|image|string|||
|user_id|integer|null:false, foreign_key: true|
|group_id|integer|null:false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :comments


## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post
