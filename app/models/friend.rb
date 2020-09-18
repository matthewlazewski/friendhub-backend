class Friend < ApplicationRecord
    validates :user1, :user2, :status, presence: true
    validates :user1, uniqueness: { scope: :user2 }
    validates :status, :inclusion => { in: ["pending", "active"]}

    
end
