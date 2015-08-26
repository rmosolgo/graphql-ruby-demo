Rails.application.routes.draw do
  root to: redirect("graphiql")
  resources :queries
  resource :sha, only: :show
  get "graphiql", to: "pages#graphiql"
end
