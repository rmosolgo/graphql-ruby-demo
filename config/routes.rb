Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/queries"
  resources :queries
  resource :sha, only: :show

  root to: "pages#homepage"
end
