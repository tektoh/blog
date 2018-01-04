module UserName
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true, uniqueness: true, length: { maximum: 32 }, format: { with: /\A(?=.*[a-z])[a-z\d]+\Z/i, message: '英数字で入力してください' }
  end
end
