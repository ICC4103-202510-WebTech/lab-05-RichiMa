class AddReferencesToMessages < ActiveRecord::Migration[8.0]
  def change
    add_reference :messages, :user, null: false, foreign_key: true
    add_reference :messages, :chat, null: false, foreign_key: true
  end
end