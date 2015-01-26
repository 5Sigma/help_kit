Rails.application.routes.draw do
  mount HelpKit::Engine => "/help"
end
