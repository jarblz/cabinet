Rails.application.routes.draw do
  # admin routes ############################
  get "/admin/company/:name/job_postings/new" => "admin/job_postings#new", as: 'new_admin_company_job_posting'
  namespace :admin do
    # resources :users
    root to: "dashboard#index"
    resources :users
    resources :traits
    resources :competencies
    resources :industries
    resources :job_postings, except: [:new]
    resources :companies
  end

  # non-admin routes #########################
  root to: 'dashboard#home'

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  get "incomplete_user", to: 'dashboard#incomplete_user', as: 'incomplete_user'

  get "core_info", to: 'users#core_info', as: 'core_info'
  patch "update_core_info", to: 'users#update', as: 'update_core_info'
  patch "update_assessment", to: 'users#update', as: 'update_assessment'

  get "assessment", to: 'users#assessment', as: 'assessment'

  get "recruiter/edit_recruiter_code", to: 'users#edit_recruiter_code', as: 'edit_recruiter_code'
  patch "recruiter/link_company", to: 'users#link_recruiter_company', as: 'link_company_post'

end
