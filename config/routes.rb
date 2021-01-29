Rails.application.routes.draw do
  # root to: 'books#top'
  # get 'books/top'
  # get 'books/books'
  # get 'books/show'
  # get 'books/edit'
  root to: 'books#top'
  get 'books' => 'books#books'
  resources :books
end
