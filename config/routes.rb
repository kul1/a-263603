Rails.application.routes.draw do
  mount Jinda::Engine => "/jinda" 
  post '/auth/:provider/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/auth/failure' => 'sessions#destroy'
  get '/logout' => 'sessions#destroy', :as => 'logout'
  get '/articles/my' => 'articles#my'
  get '/articles/my/destroy' => 'articles#destroy'
  get '/articles/show' => 'articles/show'
  get '/articles/edit' => 'articles/edit'
  get '/docs/my' => 'docs/my'
  get '/notes/my' => 'notes/my'
  get '/docs/my/destroy' => 'docs#destroy'
  get '/notes/my/destroy/:id' => 'notes#destroy'
  get '/notes/destroy/:id' => 'notes#destroy'
 #  get '/jinda/document/:id' => 'jinda#document'
  resources :articles do resources :comments end
  resources :comments
  resources :notes
  resources :docs
  resources :users
  resources :identities
  resources :sessions
  resources :password_resets
  # resources :jinda, :only => [:index, :new]
  # root :to => 'jinda'
  # api
  get '/api/v1/notes/my' => 'api/v1/notes#my'
  post '/api/v1/notes' => 'api/v1/notes#create', as: 'api_v1_notes'
  namespace :api do
  namespace :v1 do resources :notes, :only => [:index] end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
