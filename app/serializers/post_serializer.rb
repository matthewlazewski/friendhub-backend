class PostSerializer < BaseSerializer
    attributes :body 
    attribute :author do |post|
      post.user.try(:name)
    end
  
    belongs_to :user
    has_many :comments
  end