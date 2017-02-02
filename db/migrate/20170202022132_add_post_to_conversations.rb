class AddPostToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :post, :text
  end
end
