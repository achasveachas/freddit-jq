class AddImageUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :image_url, :string, default: "http://i0.wp.com/www.artifacting.com/blog/wp-content/uploads/2010/11/Kitten.jpg"
  end
end
