Rails.application.routes.draw do
  get "orders/index" => "orders#index"
  get 'orders/:id' => "orders#show"
  post "orders/:id/create" => "orders#create"
  get "orders/check/:id" => "orders#check"
  post "orders/destroy/:id" => "orders#destroy"
  get "orders/edit/:id" => "orders#edit"
  post "orders/:id/update" => "orders#update"
  post "orders/decision" => "orders#decision"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
