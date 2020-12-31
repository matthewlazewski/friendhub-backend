class Like < ApplicationRecord
    validates :post, :user, presence: true
    validates_uniqueness_of :post_id, :scope => [:user_id]

    belongs_to :post,
        primary_key: :id,
        foreign_key: :post_id
    
    belongs_to :user 
        primary_key: :id,
        foreign_key: :user_id
end
