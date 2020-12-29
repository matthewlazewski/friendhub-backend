class LikeSerializer < BaseSerializer
    attribute :author do |like|
      comment.user.try(:name)
    end
  
    belongs_to :post
    belongs_to :user
end