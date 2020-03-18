# frozen_string_literal: true

module UserName
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, uniqueness: true, length: { maximum: 32 }, slug_format: true
    validate :valid_unique_username?, on: :create
  end

  def valid_unique_username?
    if User.exists?(name: name)
      errors.add(:name, "は登録されています")
      false
    else
      true
    end
  end
end
