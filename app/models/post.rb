class Post < ApplicationRecord
    validates :body, :user_id, presence: true

    belongs_to :author
    has_many :likes
    has_many :comments
end
