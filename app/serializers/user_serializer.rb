class UserSerializer < BaseSerializer
    attributes :name, :email
    
    has_many :posts
    has_many :likes
    has_many :comments
  end