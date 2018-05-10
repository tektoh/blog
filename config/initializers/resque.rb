if Rails.env.staging? || Rails.env.production?
  Resque.redis = Redis.new(Settings.resque.redis.to_h)
  Resque.after_fork = proc { ActiveRecord::Base.establish_connection }

  logger = ActiveSupport::Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"), 5, 10 * 1024 * 1024)
  logger.formatter = config.log_formatter
  Resque.logger = ActiveSupport::TaggedLogging.new(logger)
end
