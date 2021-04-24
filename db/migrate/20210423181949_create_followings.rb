class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, null: false

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :friend_id
  end
end
