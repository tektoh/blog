# frozen_string_literal: true

namespace "db" do
  task "seed" do
    Rake::Task["db:seed_fu"].invoke
  end
end
