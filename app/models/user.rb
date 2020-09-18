class User < ApplicationRecord
    validates :name, :workplace, :password_digest, presence: true
    validates :email, presence: true, uniqeness: true
    validates :password, length: {minimum: 6}, presence: true

    has_many :posts
    has_many :friends
    has_many :likes
    has_many :comments
end
