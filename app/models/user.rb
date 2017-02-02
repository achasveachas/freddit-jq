class User < ApplicationRecord
  has_secure_password
  validates :username, :email, presence: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i}
  validates :passord, length: {minimum: 6}, on: :create
  validates :passord, confirmation: true, on: :create
end
