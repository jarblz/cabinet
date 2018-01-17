Rails.application.routes.draw do

  namespace :admin do
    # resources :users
    root to: "dashboard#index"
    resources :users
    resources :traits
    resources :companies
  end

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }

  root to: 'dashboard#home'

  get "setup_progress", to: 'dashboard#incomplete_user_setup', as: 'incomplete_user_setup'
  get "recruiter/link_company", to: 'dashboard#link_recruiter_company', as: 'link_company'
  post "recruiter/link_company", to: 'dashboard#link_recruiter_company', as: 'link_company_post'

end
