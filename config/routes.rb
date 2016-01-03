Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }, :constraints => { :subdomain => "auth" }
  mount API => "/"
  root "home#welcome"
end
