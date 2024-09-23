# frozen_string_literal: true

Rails.application.routes.draw do
  if Rails.env.development?
    mount Lookbook::Engine, at: '/lookbook'
  end

  devise_for :users

  root 'home#index'
  get 'up' => 'rails/health#show', as: :rails_health_check
end
