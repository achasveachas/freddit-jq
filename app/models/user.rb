class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true
  validates :username, uniqueness: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :password, length: {minimum: 6}, on: :create
  validates :password, confirmation: true, on: :create
end
