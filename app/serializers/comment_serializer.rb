class CommentSerializer < BaseSerializer
    attributes :content
  
    belongs_to :post
    belongs_to :user
  end