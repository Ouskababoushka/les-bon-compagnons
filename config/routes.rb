Rails.application.routes.draw do
  devise_for :users

root 'products#index'
get 'contact' => "pages#contact"

get 'carts/:id' => "carts#show", as: "cart"
delete 'carts/:id' => "carts#destroy"

post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
post 'line_items' => "line_items#create"
get 'line_items/:id' => "line_items#show", as: "line_item"
delete 'line_items/:id' => "line_items#destroy"

get 'order_confirmation' => "orders#order_confirmation"

resources :products
resources :orders

end
