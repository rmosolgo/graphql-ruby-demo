class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :from_character_id
      t.string :from_character_type
      t.integer :to_character_id
      t.string :to_character_type

      t.timestamps null: false
    end
  end
end
