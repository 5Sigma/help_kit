HelpKit::Engine.routes.draw do
  get '/' => 'landing#land', :as => :landing
  get 'edit/:title' => 'articles#edit', :as => :edit_article
  get ':title' => 'articles#show', :as => :article
  patch ':title' => 'articles#update'
  post 'new_article' => 'articles#create', :as => :new_article
end
