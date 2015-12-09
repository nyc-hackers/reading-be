Rails.application.routes.draw do
  mount API => "/"
  root "home#welcome"
end
