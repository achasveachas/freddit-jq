class AddLocationAndAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :age, :integer
    add_column :users, :location, :string
  end
end
