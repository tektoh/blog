if Rails.env.staging? || Rails.env.production?
  Resque.redis = Redis.new(Settings.resque.redis.to_h)
  Resque.after_fork = proc { ActiveRecord::Base.establish_connection }
end
