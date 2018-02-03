Rails.application.routes.draw do
  # admin routes ############################
  resources :job_postings
  get "/admin/company/:name/job_postings/new" => "admin/job_postings#new", as: 'new_admin_company_job_posting'
  namespace :admin do
    # resources :users
    root to: "dashboard#index"
    resources :users
    resources :traits
    resources :competencies
    resources :industries
    resources :job_postings, except: [:new, :index]
    resources :companies
  end



  # non-admin routes #########################
  root to: 'dashboard#home'

  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  get "incomplete_user", to: 'dashboard#incomplete_user', as: 'incomplete_user'

  get "profile", to: 'users#core_info', as: 'core_info'
  patch "update_core_info", to: 'users#update', as: 'update_core_info'

  patch "recruiter/link_company", to: 'users#link_recruiter_company', as: 'link_company_post'

  get "assessment", to: 'assessments#edit', as: 'edit_assessment'
  put "assessment/update", to: 'assessments#update', as: 'update_assessment'
  get "assessment/complete", to: 'assessments#show', as: 'assessment_complete'
  get "assessment/restart", to: 'assessments#restart', as: 'restart_assessment'

  get "candidate-jobs", to: 'job_postings#zip_jobs', as: 'candidate_job_postings'
  get "jobs/:slug", to: 'job_postings#company', as: 'company_job_postings'
  get "my-jobs", to: 'job_postings#mine', as: 'my_job_postings'

end
