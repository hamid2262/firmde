Rails.application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    get 'static_pages/google_search'

    # get 'contacts/index'
    # post 'contacts/contact_action_full'
    # post 'contacts/contact_action_brief'

    resources :site_settings

    resources :contacts
    
    resources :slideshows do
      resources :elements do
        get 'remove_photo', on: :member
      end
    end

    resources :kundens

    devise_scope :user do
      get "/users" => "users/registrations#index"
      get "/user/:id/change_role" => "users/registrations#change_role", as: "user_change_role"
    end
    devise_for :users

    resources :blocks
    resources :pages do
      resources :page_backups, only: [:show, :index, :destroy] do 
        get 'replace', on: :member
      end
    end

    resources :blogs do
      get 'admin', on: :collection
    end
    
    get "admin", to:'backends#dashboard', as: "admin"
    get "db_backup", to:'backends#db_backup', as: "db_backup"
    get "admin/loesungen", to:'backends#loesungen', as: "admin_loesungen"
    get "admin/services", to:'backends#services', as: "admin_services"
    

    get 'home/index'

    root 'home#index'

  end


  get '*path', to: redirect("/#{I18n.default_locale}/%{path}")
  get '', to: redirect("/#{I18n.default_locale}")
  
end