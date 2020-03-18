# frozen_string_literal: true

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :deletion
  end

  config.before(:each) do |_example|
    DatabaseCleaner.clean
  end
end
