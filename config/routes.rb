Mcmaster::Application.routes.draw do
  resources :mcagents, :only => [:show, :index]
  resources :filters
  resources :filter_members
  resources :actlogs, :only => [:show, :index]
  resources :nodes, :only => [:show, :index], :constraints => { :id => /.*/ }
  resources :collectives, :only => [:show, :index]
  resources :responselogs, :only => [:show, :index]
  
  resources :ddls do
    match '/validate/:mcaction' => 'ddls#validate', :via => [:GET, :POST]
  end
  
  match '/actlogs/replay/:id' => 'actlogs#replay', :via => [:GET]
  match '/discover' => 'discover#discover', :via => [:GET, :POST]
  match '/search' => 'search#search', :via => [:GET, :POST]
  match '/execute/:agent/:mcaction' => 'execute#execute', :via => [:GET, :POST]
  match '/mq/:queue' => 'restmq#get', :via => [:GET]
  match '/mq/:queue/:id' => 'restmq#get', :via => [:GET]
  match '/mq/:queue' => 'restmq#post', :via => [:POST]

  devise_for :users
  resources :users

  root :to => "home#index"
end
