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

・ログイン情報（テスト用）

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


## ログイン
[![Image from Gyazo](https://i.gyazo.com/f639efd2265ff0af5df21bfc14408f17.gif)](https://gyazo.com/f639efd2265ff0af5df21bfc14408f17)


## 投稿機能
[![Image from Gyazo](https://i.gyazo.com/1a08c5ff252b72220ddbb31381b34bef.gif)](https://gyazo.com/1a08c5ff252b72220ddbb31381b34bef)


## 投稿詳細表示機能
[![Image from Gyazo](https://i.gyazo.com/84e429736d0cf5a116f6459b109f703a.gif)](https://gyazo.com/84e429736d0cf5a116f6459b109f703a)


## ログインユーザー詳細機能
[![Image from Gyazo](https://i.gyazo.com/64ddb848c488ef1710e5b14a3c851f92.gif)](https://gyazo.com/64ddb848c488ef1710e5b14a3c851f92)


## 投稿編集機能
[![Image from Gyazo](https://i.gyazo.com/9c829d07341a8b87ea59940c45fe4fa2.gif)](https://gyazo.com/9c829d07341a8b87ea59940c45fe4fa2)


## 投稿削除機能
[![Image from Gyazo](https://i.gyazo.com/008d98d4ad0717f1494ad33a4d99b7a8.gif)](https://gyazo.com/008d98d4ad0717f1494ad33a4d99b7a8)


## コメント機能
[![Image from Gyazo](https://i.gyazo.com/5958b906a90ae15b14f386b323064b6c.gif)](https://gyazo.com/5958b906a90ae15b14f386b323064b6c)


## 投稿検索機能
[![Image from Gyazo](https://i.gyazo.com/69ce7a03f17119e37e4b18eb51f12f10.gif)](https://gyazo.com/69ce7a03f17119e37e4b18eb51f12f10)


# 工夫したポイント(開発環境)
個人的にシンプルなものが好きなので特に複雑なCSSなどは使わず今まで学習してきたものを使っています。
ユーザーのアクセス制限（ログインユーザーのみ閲覧可能、ログアウトユーザーはトップページに遷移されるなど）
before_action、privateメソッドなども活用しています。実際の投稿アプリなどを見てみるとユーザーにアクセス制限を儲けているので本番での環境を意識し実装しました。
投稿時にactive hashを使用し簡単に短時間で投稿できるように意識しています。


# 使用技術
・バックエンド
Ruby, Ruby on Rails

・フロントエンド
Html, CSS

・データベース
MySQL, SequelPro

・インフラ
AWS(S3) Active storage使用

・ソースコード管理
GitHub, GitHubDesktop

・テスト
RSpec　(モデル単体テスト)

・エディタ
VSCode


# ER図
[![Image from Gyazo](https://i.gyazo.com/80fb7999b121033e7b28bb2090ed75a7.png)](https://gyazo.com/80fb7999b121033e7b28bb2090ed75a7)


# users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |

## Association
- has_many :cans
- has_many :comments


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


# comments テーブル

| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| text    | text       | null: false       |
| user_id | references | foreign_key: true |
| can_id  | references | foreign_key: true |

## Association
- belongs_to :user
- belongs_to :can
