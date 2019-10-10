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
- spring: Rails CLI の受付
- guard: spec, linter の自動実行

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

コンテナが起動した状態で以下を実行してください

```bash
docker-compose exec spring rails db:setup
```

### その他の操作

Gemfile, package.json を変更した場合はコンテナを再起動してください

```bash
docker-compose stop
docker-compose up
```

`rails` コマンドは spring のコンテナで実行してください

```bash
docker-compose exec spring rails db:migrate
```

binding.pry する場合は `docker-compose ps` で Rails サーバーのイメージ名を確認し、 `docker attach [イメージ名]` でコンテナにアタッチしてください。

各コンテナはvolumeで bundler や node_modules を共有しています。
bundle install や yarn install が競合しないようにロックファイルを作成して制御しています。
コンテナを起動中に強制終了するとロックファイルがvolumeに残ってしまうことがあります。
コンテナが起動しなくなった場合はロックファイルを削除してみてください。

[FIXME] 誰かもっとイケてる感じにしてほしい => docker-entrypoint.sh

```bash
dc exec spring rm /usr/local/bundle/.wait
dc exec spring rm /app/node_modules/.wait
```

bundle update

```bash
docker-compose run rails bundle update
```

## Dockerを使わない場合

rbenv, bundler, nodenv, yarn, postgresql, redis が必要です。


.env に以下の環境変数を追加してください

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

Resqueの起動

```bash
bundle exec rails resque:work
```

webpack-dev-serverの起動

```bash
bin/webpack-dev-server
```

guardの起動

```bash
bundle exec guard -i
```

