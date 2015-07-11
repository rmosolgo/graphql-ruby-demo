Rails.application.routes.draw do
  root to: redirect("queries/new")
  resources :queries
end
