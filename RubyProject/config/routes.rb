Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get '/graphql', to: 'graphql#execute'

  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "graphql#execute"
  end

  namespace :api, path: "" do
    namespace :v1 do
      resources :companies do
        match 'mark_deleted', to: 'companies/mark_deleted', via: :put
        resources :jobs
      end
      resources :jobs
      resources :applies
      resources :geeks
    end
  end

  resources :resorts
end
