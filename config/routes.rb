# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: '/lookbook'
    # ERD
    get '/erd', to: 'docs#erd'
  end

  authenticate :user, lambda { |u| u.has_role?(:super_admin) } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users,
    controllers: {
      sessions: 'authentication/sessions',
      registrations: 'authentication/registrations',
      omniauth_callbacks: 'authentication/omniauth_callbacks'
    }

  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
