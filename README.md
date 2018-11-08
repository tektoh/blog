# Blog

ブログシステム

## Ruby version

- See `.ruby-version`.

## Rails version

- See `Gemfile`.

## System dependencies

- Postgresql
- Redis
- Node.js
- Yarn

### System dependencies for Development

- docker
- docker-compose
- docker-sync

## Project initiation

- リポジトリのクローン

```bash
$ git@github.com:startup-technology/blog.git
```

- Gemのインストール

```bash
$ bundle install --path vendor/bundle
```

- npmのインストール

```bash
$ yarn install
```

### Configuration

*ファイルの中身はご自身の環境に合わせて適宜変更してください*

- データベースの設定

```bash
$ cp config/database.yml.default config/database.yml
```

- 環境変数の設定

```bash
$ cp .env.default .env
```

*AWSのアクセスキーなどは個別に担当者に聞いてください。*

### Build docker containers

```bash
$ docker-compose build
```

## Run rails server

```bash
$ bundle exec rails server
```

or

```bash
$ docker-sync-stack start
```

### Database initialization

```bash
$ rails db:setup
```

or

```bash
$ docker-compose exec rails rails db:setup
```

## Webpacker

JavaScriptのコンパイル

```
$ ./bin/webpack
```

サーバーの起動

```
$ ./bin/webpack-dev-server
```

## Run specs

```bash
$ spring rspec spec/[対象ファイル]
```

or

```bash
$ docker-compose exec rails bin/rspec spec/[対象ファイル]
```

## How to run the static code analysis

### Rubocop

```bash
$ bundle exec rubocop -R
```

### Reek

```bash
$ bundle exec reek
```

### Rails best practices

```bash
$ bundle exec rails_best_practices
```

### Brakeman

```bash
$ bundle exec brakeman
```

### ESLint

```bash
$ npm run lint
```

### SCSS-Lint

```bash
$ bundle exec scss-lint
```

### Slim-Lint

```bash
$ bundle exec slim-lint
```

## EditorConfig

-  ご自身のエディタに[EditorConfig](http://editorconfig.org/)のインストールをお願いします。

## Development controller

### Force login

- See `app/controllers/development/sessions_controller.rb`

```
/login_as/[user_id]
```

