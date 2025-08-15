# README

社員管理システム

- 開発環境構築の流れ
    - PostgreSQLのインストールから起動および停止
        - sudo apt update
        - sudo apt install postgresql postgresql-contrib
        - service --status-all
            - まだ postgresql は起動していないことを確認
        - sudo service postgresql start
            - 起動
        - service --status-all
            - postgresql が起動していることを確認
        - sudo su postgres
            - postgres ユーザーに変更
            - rm: cannot remove '/usr/local/share/nvm/current': Permission denied とでるのは気にしなくて OK
        - psql
            - PostgreSQL に入る
        - \q
            - PostgreSQL から出る
        - exit
            - postgres ユーザーから元のユーザーに戻る
        - sudo service postgresql stop
            - 停止
        - service --status-all
            - postgresql が停止していることを確認
    - Rails の導入
        - gem install rails
        - rails -v
        - rails new . --database=postgresql
            - READMEが競合するが更新
    - Devise Gemの導入
        - Gemfileにgem 'devise'を追加し、bundle installを実行
        - rails generate devise:install
        - rails generate devise User
        - rails db:migrate
- POSTリクエストが処理できない問題を対応
    - https://zenn.dev/hamajyotan/articles/8a7e430a556b3e#post-%E3%83%AA%E3%82%AF%E3%82%A8%E3%82%B9%E3%83%88%E3%81%8C%E5%87%A6%E7%90%86%E3%81%A7%E3%81%8D%E3%81%AA%E3%81%84

## 概要

このプロジェクトは、Ruby on Railsで構築された社員管理システムです。
社員情報の登録、閲覧、更新、削除、およびログイン認証機能を備えています。

## 機能一覧

- **ユーザー認証**: ログイン、ログアウト機能
- **社員情報管理**:
  - 社員一覧表示（管理者・一般社員）
  - 社員詳細表示
  - 社員情報の登録（管理者のみ）
  - 社員情報の編集・削除（管理者のみ）
- **アクセス制御**:
  - 管理者フラグによる認可制御
  - 管理者のみが社員情報登録・編集・削除可能
  - パスワード変更機能

## 開発環境構築手順

### 前提条件

- **Ruby**: 3.2.2
- **Rails**: 7.0.8
- **PostgreSQL**: データベース
- **Git**: バージョン管理

### 1. リポジトリをクローン

```bash
git clone https://github.com/techtech0521/employee_management_system
cd employee_management_system
```

### 2. 依存関係のインストール

```bash
bundle install
yarn install
```

### 3. データベースのセットアップ

```bash
rails db:create
rails db:migrate
```

### 4. サーバーの起動

```bash
rails s
```

### 5. テストの実行

```bash
bundle exec rspec
```

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
