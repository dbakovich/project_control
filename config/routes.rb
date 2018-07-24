Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :projects do
    resources :tasks do
      resources :users
    end
  end

  root 'welcome#index'
end
