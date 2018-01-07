module Role
  extend ActiveSupport::Concern

  included do
    enum role: {
      writer: 0,
      articleBlockEditor: 10,
      admin: 20
    }

    validates :role, presence: true
  end
end
