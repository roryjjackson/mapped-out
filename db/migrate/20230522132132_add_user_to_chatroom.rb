class AddUserToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :user, null: false, foreign_key: true
    add_reference :chatrooms, :user2, null: false, foreign_key: { to_table: :users}
  end
end
