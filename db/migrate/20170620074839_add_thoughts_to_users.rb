class AddThoughtsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :thoughts, :string
  end
end
