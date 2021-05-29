# 気になるニュース

## 概要

###### 世界のニュースをいち早く各地して、同僚と共有できるブログ。気になるニュースのトピックを立てると同じチームにlineで連絡。ニューストピック内ではコメント機能で同僚と議論も可能。

## コンセプト

###### 最新ニュースをいち早く覚知して同僚と共有できるサービス

## コンセプト

###### 最新ニュースをいち早く覚知して同僚と共有できるサービス

## バージョン情報

###### ruby 2.6.5 rails 5.2.5

## 機能一覧

- ニュース一覧機能（NEWS APIでニュース一覧を取得）
  - 最新のニュースを取得して一覧表示する機能
- 「気になるニュース」
  - 選択した「気になるニュース」についてトピックを開設する機能(実質新規投稿)
  - 「気になるニュース」削除機能
  - ニュースタイトルとリンクを表示するだけなので編集・詳細機能なし
  - キーワードに合致するニュースを抽出する機能
- ユーザーCRUD機能
- コメント作成機能
  - 作成された「気になるニュース」を一覧ページ上でモーダル表示→コメントを追加
- AWSのEC2にアプリケーションをデプロイ(就業Termから)
- ピックアップした「気になるニュース」にAjaxでユーザーがコメントを追加できる機能(就業Termから)
- 管理者ページ（ユーザーの追加、編集、削除)
- お気に入り機能
  - お気に入りのニュースに「いいね」する機能

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
