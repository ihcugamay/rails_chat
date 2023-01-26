class User < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  has_secure_password
end
