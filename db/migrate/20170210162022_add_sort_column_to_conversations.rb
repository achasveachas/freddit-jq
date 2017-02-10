class AddSortColumnToConversations < ActiveRecord::Migration[5.0]
  def change
    add_column :conversations, :sort_column, :datetime
  end
end
