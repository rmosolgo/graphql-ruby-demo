Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/queries"
  root to: redirect("/graphiql")
  resources :queries
  resource :sha, only: :show
end
