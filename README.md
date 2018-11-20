## Application name
スペースマーケット ( クローンサイト )
<br>[http://52.68.162.244/](http://52.68.162.244/)

## Overview
スペースマーケット ( https://www.spacemarket.com/ )のクローンサイトです。
<br><br>以下の3人でアジャイル開発しました。
- manami-kk ( https://github.com/manami-kk )
- sasuke7779 ( https://github.com/sasuke7779 )
- jiko797torayo ( https://github.com/jiko797torayo )

<br>作業進捗は以下のツールで管理しました。
- Trello
- 自作した進捗管理表( https://docs.google.com/spreadsheets/d/1xFfoMjcjUavjqYEwKzUPC5K1SJxrK2UNwRGFVheBXGE/edit#gid=1796792328 )

<br>制作期間は1ヶ月という制限の中で、サービスとして重要な機能を優先して実装しました。
<br><br>実装した主な機能は、以下の機能です。
- ユーザー登録機能
- スペース登録機能
- スペース編集機能
- スペース削除機能
- スペース詳細機能
- スペース予約機能
- 予約完了時のメール送信機能

## Development environment
* ruby  2.3.1
* rails 5.0.7

## Test environment
* RSpec 3.8.0
* capybara 2.18.0

## Production environment
* Linux server<br>　EC2 ( AWS )
* Web server<br>　nginx 1.12.1
* Application server<br>　unicorn v5.4.1

## Database
* mysql2 0.3.21
* S3(AWS) ※画像のみ
* ER図 ( https://github.com/jiko797torayo/space-market/issues/54 )


