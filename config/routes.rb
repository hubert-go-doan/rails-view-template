# frozen_string_literal: true
require 'sidekiq/web'
require 'sidekiq-scheduler/web'

if (sidekiq_web_username = ENV['SIDEKIQ_WEB_USERNAME']).present? && (sidekiq_web_password = ENV['SIDEKIQ_WEB_PASSWORD']).present?
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(username), Digest::SHA256.hexdigest(sidekiq_web_username)) &
      ActiveSupport::SecurityUtils.secure_compare(Digest::SHA256.hexdigest(password), Digest::SHA256.hexdigest(sidekiq_web_password))
  end
end

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

  if Rails.env.development?
    get '/erd', to: 'docs#erd'
  end

  authenticate :user, lambda { |u| u.has_role?(:super_admin) } do
    mount ActiveStorageDashboard::Engine, at: "/active-storage-dashboard"

    unless Rails.env.production?
      get 'admin/console', to: 'admin/console#index'
    end
  end

  devise_for :users,
    controllers: {
      sessions: 'authentication/sessions',
      registrations: 'authentication/registrations',
      omniauth_callbacks: 'authentication/omniauth_callbacks'
    }

  namespace :admin do
    resources :users

    root to: 'users#index'
  end

  namespace :employees do
    # Add employee routes here
  end

  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
