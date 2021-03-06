# frozen_string_literal: true

if Rails.env.development?
  require "yuml_diagram"

  task yuml_diagram: :environment do
    Dir[Rails.root.join("app/models/**/*.rb")].sort.each { |f| require_dependency f }
    puts YumlDiagram.create
  end
end
