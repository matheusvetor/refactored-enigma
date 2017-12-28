Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, except: [:new, :edit] do
        get 'search', on: :collection
      end
    end
  end
end
