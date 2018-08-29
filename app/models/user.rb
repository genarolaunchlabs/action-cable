class User < ApplicationRecord
  has_many :messages
  has_many :posts
  has_many :comments
  NAME_REGEX = /\w+/
  validates :username, presence: true, uniqueness: { case_sensitive: false },
                       format: { with: /\A#{NAME_REGEX}\z/i },
                       length: { maximum: 15 }
  validates :password, presence: true, length: { minimum: 6 }
  has_secure_password

  scope :exclude, ->(id) { where.not(id: id) }
end
