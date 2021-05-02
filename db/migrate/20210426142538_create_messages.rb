class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.references :send_user, null: false
      t.references :receive_user, null: false
      t.string :text

      t.timestamps
    end
    add_foreign_key :messages, :users, column: :send_user_id
    add_foreign_key :messages, :users, column: :receive_user_id
  end
end
