Rails.application.routes.draw do  
  get 'practice/index'
  post 'practice/index'
  get "orders/:id/check" => "orders#check"
  post "orders/:id/destroy" => "orders#destroy"
  post "orders/:id/update" => "orders#update"
  get "orders/index" => "orders#index"
  get 'orders/:id' => "orders#show"
  post "orders/:id/create" => "orders#create"
  get "orders/:id/edit" => "orders#edit"
  post "orders/decision" => "orders#decision"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
