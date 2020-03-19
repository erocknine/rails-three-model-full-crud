class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books
  validates :name, :birth_year, presence: true
  validates :name, :birth_year, uniqueness: true
  
end
