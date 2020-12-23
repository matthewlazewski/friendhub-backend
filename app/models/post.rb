class Post < ApplicationRecord
    validates :body, :user_id, presence: true

    belongs_to :user
    has_many :likes, dependent: :destroy
    has_many :users, through: :comments
    has_many :comments
end
