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
