class Book < ApplicationRecord
  has_many :author_books
  has_many :authors, through: :author_books
  validates :title, :page_count, presence: true
  validates :title, uniqueness: true
  
end
