class CreateAuthorsBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :author_books do |t|
      t.integer :author_id, foreign_key: true
      t.integer :book_id, foreign_key: true
    end
  end
end
