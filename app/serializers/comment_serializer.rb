class CommentSerializer < BaseSerializer
    attribute :content
    attribute :author do |comment|
      comment.user.try(:name)
    end
  
    belongs_to :post
    belongs_to :user
end