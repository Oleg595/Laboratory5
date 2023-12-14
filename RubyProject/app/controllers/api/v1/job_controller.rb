class JobsController < ActionController::Base
  scope module: 'api' do
    namespace :v1 do
      resources :jobs
      resources :companies do
        resources :jobs
      end
    end
  end
end
