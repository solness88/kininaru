# 気になるニュース

## 概要

###### 世界のニュースをいち早く各地して、同僚と共有できるブログ。気になるニュースのトピックを立てると同じチームにlineで連絡。ニューストピック内ではコメント機能で同僚と議論も可能。

## コンセプト

###### 最新ニュースをいち早く覚知して同僚と共有できるサービス

## コンセプト

###### 最新ニュースをいち早く覚知して同僚と共有できるサービス

## バージョン

###### ruby 2.6.5 rails 5.2.5

## 機能一覧

- ニュース一覧機能（NEWS APIでニュース一覧を取得）
  - 最新のニュースを取得して一覧表示する機能
  - 投稿ニュースCRUD機能
- 検索機能
  - キーワードに合致するニュースを抽出する機能
- ユーザーCRUD機能
- ユーザー一覧表示機能
- 「気になるニュース」CRUD機能
  - 選択した「気になるニュース」についてトピックを開設する機能(実質新規投稿)
  - 「気になるニュース」削除機能
- コメントCRUD機能
  - 作成された「気になるニュース」にコメントを追加・編集・削除していく機能
- LINE連絡機能
  - 選択したニュースをボタン一つでLINEグループに送信して共有
- AWSのEC2にアプリケーションをデプロイ(就業Termから)
- ピックアップした「気になるニュース」にユーザーがコメントを追加できる機能(就業Termから)
- LINE APIで気になるニュースをLINEのグループに投稿
- 管理者ページ（ユーザーの追加、編集、削除)


## カタログ設計
https://docs.google.com/spreadsheets/d/1Qz7Ro1XFWc_9SWmaCtucWo2CwVwM92l0KC5T8xgpcqs/edit?usp=sharing

## テーブル定義
https://docs.google.com/spreadsheets/d/1VvgNPUUB20Oxnky6gAsuBK0OFobkphGCzxEmo9hG0fc/edit?usp=sharing

## 画面遷移図
https://docs.google.com/spreadsheets/d/1GHnddGJTvr99qLWUOB7NG3VZrQ7vbJRwDpFCJiPr5PM/edit?usp=sharing

## 画面ワイヤーフレーム
https://docs.google.com/spreadsheets/d/1ByrjgM3FThwsXyLk55-oAcw17aOEIaH8-ANKmjKsOUs/edit?usp=sharing

## 使用予定gem
- carrierwave（画像アップロード）
- mini_magick（アップロードした画像ファイルのサイズを変更）
