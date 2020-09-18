class Comment < ApplicationRecord
    validates :user, :post, :content, presence: true

    belongs_to :user
    belongs_to :post

end
