# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend
      t.boolean :confirmed, default: false

      t.timestamps
    end
    add_index :friendships, %i[user_id friend_id]
  end
end
