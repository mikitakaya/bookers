Rails.application.routes.draw do
# ルーティングの設定
 root to: 'homes#top'

 post 'books' => 'books#create'
 get 'books' => 'books#index'
 get 'books/:id' => 'books#show', as: 'book'
 delete 'books/:id' => 'books#destroy', as: 'destroy_book'
 get 'books/:id/edit' => 'books#edit', as: 'edit_book'
 patch 'books/:id' => 'books#update', as: 'update_book'
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end