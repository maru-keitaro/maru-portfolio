# アプリケーション名
Action-log(アクションログ)

# 概要
自分が出来たことを記録、投稿できるアプリケーションになっています。
投稿することで他の閲覧者からコメントをもらえるので共有もできるようになっています。

# 本番環境
・URL : https://maru-portfolio-1.herokuapp.com/

・Basic認証  
ユーザー名 : action  
パスワード : 5599

・ログイン情報（テスト用)  
投稿済みユーザー  
メールアドレス : maru@exsample  
パスワード : km12345

投稿済みではないユーザー  
メールアドレス : kei@exsample  
パスワード : km12345

# 制作意図(背景)
私がこのアプリを作ろうと思ったきっかけは、学習で自分がやってきた事を可視化する事で上手くいかない時に過去を振り返ったことで、これだけやってきたのだから大丈夫！と思えるようなサービスが欲しいと思ったのでこのアプリを制作しました。もう一つ、社会人になると日々の仕事などで学習に時間が取れないことがあると思いますがそのような人たちにも少しでも良いので学習を継続しようと思えるようなアプリ作りをしようと思いました。実際にプログラミングを学習していると解決出来ない問題やエラーなどで詰まってしまうことがありモチベーションの低下などに繋がってきてしまうこともあったのでしっかりと継続し続ける意味でも過去の記録を振り返ることはとても大事だと感じました。
このアプリケーション制作を通して0からものづくりをする大変さを実感しました。その一方で今まで出来なかったことができるようになったという喜びも感じとても貴重な制作期間になったと思います。

# DEMO

## 新規登録
[![Image from Gyazo](https://i.gyazo.com/6a0e1240b19fe0a42de3dbc2d2fa5520.gif)](https://gyazo.com/6a0e1240b19fe0a42de3dbc2d2fa5520)
新規登録はgem deviseを使いシンプルにnickname,email,passwordのみで登録できるようにしています。
nicknameは6文字以内、パスワードは6文字以上でバリデーションをかけています。
エラー文は全て日本語対応できるように gem rails-i18nを導入し対応しています。
(新規登録は右上のリンクから。Action Logリンクからトップページに戻れます)

## ログイン

ログインも同じくgem deviseを使っています。
ログイン、ログアウトした場合、トップページのユーザー名下にflashで表示できるようしています。
(ログインは右上のリンクから。Action Logリンクからトップページに戻れます)


## 投稿機能
[![Image from Gyazo](https://i.gyazo.com/1a08c5ff252b72220ddbb31381b34bef.gif)](https://gyazo.com/1a08c5ff252b72220ddbb31381b34bef)
投稿機能はActive Hashを使用し選択式にしています。メモ以外は選択必須になるのでエラー文を日本語で設定しております。
画像はActive storageを使用。S3を使用し本番環境での保存も確認取れています。
(ログインユーザーのみ投稿が出来ます。)

## 投稿詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/a3843190a67993d217a1d7ff0957313e.gif)](https://gyazo.com/a3843190a67993d217a1d7ff0957313e)
投稿詳細表示機能では細かい詳細、日時を記載できるようにしました。日時も日本時間対応済みです。


## ログインユーザー詳細機能
[![Image from Gyazo](https://i.gyazo.com/66641d0bcd83d0f4fb4ce05a087c0c08.gif)](https://gyazo.com/66641d0bcd83d0f4fb4ce05a087c0c08)
ログインユーザー詳細機能だは左上にログインユーザーのnicknameを記載しそちらから現在ログインしているユーザーの投稿一覧を表示することが出来ます。
(ログインしていない場合はユーザー名は表示されません。)


## 投稿編集機能
[![Image from Gyazo](https://i.gyazo.com/9c829d07341a8b87ea59940c45fe4fa2.gif)](https://gyazo.com/9c829d07341a8b87ea59940c45fe4fa2)
投稿編集機能ではログインユーザーかつ投稿者のみ表示、編集できるようにしています。urlからのアクセス制限も指定しているためログイン中でも投稿していない場合トップページに止まるように設定しております。


## 投稿削除機能
[![Image from Gyazo](https://i.gyazo.com/008d98d4ad0717f1494ad33a4d99b7a8.gif)](https://gyazo.com/008d98d4ad0717f1494ad33a4d99b7a8)
投稿削除機能こちらも編集と同様にログインユーザーかつ投稿者のみ表示、削除できるようにしています。


## コメント機能
[![Image from Gyazo](https://i.gyazo.com/5958b906a90ae15b14f386b323064b6c.gif)](https://gyazo.com/5958b906a90ae15b14f386b323064b6c)
コメント機能はログインユーザーのみコメントができるようになっています。
ログアウトユーザーはコメント欄のところに ※コメントを投稿する場合ログインが必要です!※ と記載がされています。


## 投稿検索機能
[![Image from Gyazo](https://i.gyazo.com/dfe26efc793e685c1b1801cd6969a8a2.gif)](https://gyazo.com/dfe26efc793e685c1b1801cd6969a8a2)
投稿検索機能ではカテゴリーを選択することによってそのカテゴリー別の投稿一覧が表示されるようになっています。
(こちらはログアウトユーザーも検索可能になっています。)


## いいね機能
[![Image from Gyazo](https://i.gyazo.com/1d0fec8b3e7809b80a273b3df4584219.gif)](https://gyazo.com/1d0fec8b3e7809b80a273b3df4584219)
いいね機能ではハートのアイコンをクリックするといいねの数がカウントできるようになっています。(ログインユーザーのみいいねができるようになっています。Font Awesomeを使用)


## フォロー機能
[![Image from Gyazo](https://i.gyazo.com/ac44d5849128cd5d31388a90deb3dcff.gif)](https://gyazo.com/ac44d5849128cd5d31388a90deb3dcff)
他のユーザーの詳細ページにアクセスするとフォロー、フォロー解除ができるようになっています。
自身の詳細ページにアクセスした場合はフォロー、フォロワーの数の表示、どのユーザーをフォローしているのか、どのユーザーからフォローを受けているのか、確認できるようになっています。


# 工夫したポイント(開発環境)
個人的にシンプルなものが好きなので特に複雑なCSSなどは使わず今まで学習してきたものを使っています。
ユーザーのアクセス制限（ログインユーザーのみ閲覧可能、ログアウトユーザーはトップページに遷移されるなど）
before_action、privateメソッドなども活用しています。実際の投稿アプリなどを見てみるとユーザーにアクセス制限を儲けているので本番での環境を意識し実装しました。
投稿時にActive Hashを使用し簡単に短時間で投稿できるように意識しています。


# 使用技術

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
Html, CSS

## データベース
MySQL, SequelPro

## インフラ
AWS(S3) Active storage使用

## ソースコード管理
GitHub, GitHubDesktop

## テスト
RSpec (モデル単体テスト)

## エディタ
VSCode


# ER図
[![Image from Gyazo](https://i.gyazo.com/26be456fa2c7040a4db0424e5497a78d.png)](https://gyazo.com/26be456fa2c7040a4db0424e5497a78d)

# users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association
- has_many :cans
- has_many :comments
- has_many :likes
- has_many :active_relationships
- has_many :passive_relationships
- has_many :followings
- has_many :followers


# cans テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| active_id   | integer    | null: false       |
| place_id    | integer    | null: false       |
| set_time_id | integer    | null: false       |
| description | text       | null: false       |
| image       |            |                   |
| user_id     | references | foreign_key: true |

## Association
- belongs_to :user
- has_many :comments
- has_many :likes

# comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user_id | references | foreign_key: true |
| can_id  | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :can


# likes テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user_id | references | foreign_key: true |
| can_id  | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :can


# relationships テーブル

| Column      | Type       | Options                         |
| ----------- | ---------- | ------------------------------- |
| user_id     | references | null: false, foreign_key: false |
| target_id   | references | null: false, foreign_key: false |

## Association
- belongs_to :user
- 