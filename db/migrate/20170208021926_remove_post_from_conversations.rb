class RemovePostFromConversations < ActiveRecord::Migration[5.0]
  def change
    remove_column :conversations, :post, :text
  end
end
