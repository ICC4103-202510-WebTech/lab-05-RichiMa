class AddTableChat < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.references :sender, null: false, foreign_key: {to_table: :users} 
      t.references :receiver, null: false, foreign_key: {to_table: :users} 
      
      t.timestamps
    end
  end
end
