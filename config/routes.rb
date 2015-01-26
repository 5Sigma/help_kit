HelpKit::Engine.routes.draw do
  get 'new' => 'articles#new', :as => :new_article
  post 'new' => 'articles#create'
  get 'edit/:id' =>  'articles#edit', :as => :edit_article
  get ':id' => 'articles#show', :as => :article
  patch ':id' => 'articles#update'


end
