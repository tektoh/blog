# frozen_string_literal: true

module HasUuid
  extend ActiveSupport::Concern

  included do
    before_validation :set_uuid, on: :create

    validates :uuid, presence: true, uniqueness: true
  end

  def set_uuid
    self.uuid = SecureRandom.uuid if uuid.blank?
    uuid
  end
end
