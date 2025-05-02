class AddReferenceToChats < ActiveRecord::Migration[8.0]

  def change
    remove_column :chats, :message_id, :integer
    remove_column :chats, :user_id, :integer

    add_reference :chats, :message, null: false, foreign_key: true
    add_reference :chats, :user, null: false, foreign_key: true
  end
end
