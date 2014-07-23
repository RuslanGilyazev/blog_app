Rails.application.routes.draw do

  root 'articles#index'

  get 'welcome/index'
  
  resources :articles do
    resources :comments
  end

  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register", :edit => "edit"  }

end
