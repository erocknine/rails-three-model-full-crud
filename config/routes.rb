Rails.application.routes.draw do
  resources :books
  resources :authors
  resources :author_books

  delete '/authors/:author_id/books/:book_id', to: 'authors#delete_author_books'
  delete '/books/:book_id/authors/:author_id', to: 'books#delete_author_books'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
