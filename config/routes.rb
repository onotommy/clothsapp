Rails.application.routes.draw do
  
  root 'home#top'
  get "about" => "home#about"
  get "/:id/login_top" => "home#login_top"
  
  get "signup" => "users#new"
  post "users/create" => "users#create"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
