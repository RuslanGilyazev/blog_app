Rails.application.routes.draw do

  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end

  root 'welcome#index'

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }

end
