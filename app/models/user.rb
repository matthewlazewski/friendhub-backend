class User < ApplicationRecord
    has_secure_password

    validates :name, :password_digest, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, length: {minimum: 6}, presence: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    has_many :posts
    has_many :friends
    has_many :likes 
    has_many :comments


end
