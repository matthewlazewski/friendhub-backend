class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :user1
      t.integer :user2
      t.string :status, default: 'pending'

      t.timestamps
    end
    add_index :friends, [:user1, :user2], :unique => true
  end
end
