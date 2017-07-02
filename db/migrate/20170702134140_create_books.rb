class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.text :title
      t.text :author
      t.text :pages
      t.text :info
      t.text :rating
      t.text :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
