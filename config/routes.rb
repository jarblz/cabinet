Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }

  root to: 'dashboard#home'

  get "setup_progress", to: 'dashboard#incomplete_user_setup', as: 'incomplete_user_setup'
end
