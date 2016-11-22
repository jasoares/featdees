require 'api_version'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, path: '/', constraints: { subdomain: 'api' }, defaults: { format: :json } do
    namespace :v1, path: '/', constraints: ApiVersion[version: 1, default: true] do
      resources :featured_attendees, only: [:index, :show]
    end
  end

  root to: 'home#index'
end
