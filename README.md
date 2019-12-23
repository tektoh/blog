# Blog

ブログ

[![CircleCI](https://circleci.com/gh/tektoh/blog.svg?style=svg)](https://circleci.com/gh/tektoh/blog)

## アーキテクチャ

- Ruby on Rails
- Postgresql
- Redis

## 開発環境

### あなたのパソコンに必要なもの

- Docker
- Docker Compose
- エディタにEditorConfigプラグインを入れてください

### 環境変数
開発環境で使用するAPIキーなどは `.env` ファイルに記載します。
`.env.example` を参照してください。

```bash
cp -v .env{.example,}
```

### Dockerコンテナ

- db: データベース(Postgresql)
- cache: キャッシュサーバー(Redis)
- rails: Railsサーバー(Puma)
- webpack-dev-server: JavaScriptのコンパイル
- runner: 作業コンテナ(bash)

### Dockerコンテナのビルド

```bash
docker-compose build
```

### Dockerコンテナの起動

```bash
docker-compose up
```

コンテナが起動したらブラウザから `http://localhost:3000` でサービスにアクセスできます。

### Dockerコンテナの停止

```bash
docker-compose stop
```

### 初期設定

```bash
docker-compose run runner
# bundle install
# yarn install
```

### Dockerコンテナの起動

```bash
docker-compose up
```

初回起動時はDBの初期設定を実行してください

```bash
docker-compose run runner rails db:setup
```

### Dockerコンテナの停止

```bash
docker-compose stop
```

### その他の操作

`rails` コマンドは runner コンテナで実行してください

```bash
# generate
docker-compose run runner rails g model

# migration
docker-compose run runner rails db:migrate

# spec
docker-compose run runner rails spec

# rubocop
docker-compose run runner rubocp -a

# guard
docker-compose run runner guard -i
```

コンテナへのログイン
```bash
docker-compose run runner
```

binding.pry する場合は `docker-compose ps` で Rails サーバーのコンテナ名を確認し、 `docker attach [Railsコンテナ名]` でコンテナにアタッチしてください。

```bash
docker-compose run rails bundle update
```

## Dockerを使わない場合

rbenv, bundler, nodenv, yarn, postgresql, redis が必要です。


.env ファイルを作成し、以下の環境変数を追加してください

```
POSTGRES_HOST=localhost
POSTGRES_USERNAME=postgres
POSTGRES_PASSWORD=
REDIS_URL=redis://localhost:6379
```

ローカル環境で postgresql-server と redis-server を起動してください。

初期設定
```bash
bundle install
yarn install
bundle exec rails db:setup
```

Railsの起動

```bash
bundle exec rails s
```

webpack-dev-serverの起動

```bash
bin/webpack-dev-server
```

guardの起動

```bash
bundle exec guard -i
```

