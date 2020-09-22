class PostSerializer < BaseSerializer
    attributes :body
  
    belongs_to :user
    has_many :comments
  end