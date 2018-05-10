set :stage, :production
set :rails_env, 'production'
set :migration_role, 'db'
set :linked_dirs, %w[log tmp/backup tmp/pids tmp/cache tmp/sockets vendor/bundle node_modules public/packs]
set :workers, '*' => 1

set :whenever_environment, :production
set :whenever_roles, :batch

role :app, %w[blog@web1.production.blog-dev.com]
role :web, %w[blog@web1.production.blog-dev.com]
role :db, %w[blog@web1.production.blog-dev.com]
role :batch, %w[blog@web1.production.blog-dev.com]
role :resque_worker, %w[blog@web1.production.blog-dev.com]
