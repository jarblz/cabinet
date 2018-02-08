Rails.application.routes.draw do
  resources :job_postings
  # admin ############################
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

  # non-admin #########################
    root to: 'dashboard#home'

    devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
    get "incomplete_user", to: 'dashboard#incomplete_user', as: 'incomplete_user'

    get "profile", to: 'users#core_info', as: 'core_info'
    patch "update_core_info", to: 'users#update', as: 'update_core_info'

    patch "recruiter/link_company", to: 'users#link_recruiter_company', as: 'link_company_post'

    # assessment
    get "assessment", to: 'assessments#edit', as: 'edit_assessment'
    put "assessment/update", to: 'assessments#update', as: 'update_assessment'
    get "assessment/complete", to: 'assessments#show', as: 'assessment_complete'
    get "assessment/restart", to: 'assessments#restart', as: 'restart_assessment'

    # jobs
    get "candidate-jobs", to: 'job_postings#zip_jobs', as: 'candidate_job_postings'
    get "jobs/:slug", to: 'job_postings#company', as: 'company_job_postings'
    get "my-jobs", to: 'job_postings#mine', as: 'my_job_postings'

    # recommendations
    get "connections/:type", to: 'recommendations#connections', as: 'connections'
    get "recommendations/:type", to: 'recommendations#recommendations', as: 'recommendations'
    post "recommendations/:id", to: 'recommendations#act_on_recommendation', as: 'act_on_recommendation'

    get "company_modal_content/:slug", to: 'companies#modal_content', as: 'company_modal_content'
    get "user_modal_content/:id", to: 'users#modal_content', as: 'user_modal_content'
    get "job_posting_modal_content/:id", to: 'job_postings#modal_content', as: 'job_modal_content'



end
