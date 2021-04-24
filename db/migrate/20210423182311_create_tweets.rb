class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.references :author, null: false
      t.string :text

      t.timestamps
    end
    add_foreign_key :tweets, :users, column: :author_id
  end
end
