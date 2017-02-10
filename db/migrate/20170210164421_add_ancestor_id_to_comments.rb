class AddAncestorIdToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :ancestor_id, :integer
  end
end
