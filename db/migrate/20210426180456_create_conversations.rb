class CreateConversations < ActiveRecord::Migration[6.1]
  def change
    create_table :conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :other_user, null: false

      t.timestamps
    end
    add_foreign_key :conversations, :users, column: :other_user_id
  end
end
