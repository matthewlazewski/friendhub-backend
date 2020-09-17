class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :uid
      t.string :workplace
      t.string :profile_picture
      t.date :birthday

      t.timestamps
    end
    add_index :users, :email, unique: true 
  end
end
