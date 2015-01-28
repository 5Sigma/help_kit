HelpKit::Engine.routes.draw do


  namespace :admin do
    resources :categories
  end


  get '/' => 'landing#land', :as => :land

  get '/categories/:category' => 'articles#index_category',
    :as => :category

  get 'new' => 'articles#new', :as => :new_article
  post 'new' => 'articles#create'
  get 'edit/:id' =>  'articles#edit', :as => :edit_article
  get ':id' => 'articles#show', :as => :article
  patch ':id' => 'articles#update'


end
