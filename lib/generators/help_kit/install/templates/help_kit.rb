HelpKit.config do |config|
  # config.title is used to display the page titles.
  config.title = "Knowledgebase"

  # config.authorize should check if the current session is capable of editing
  # and managing the help system. If it does not return false or nil article
  # management will be alllowed.
  #  NOTE: If this value is not set managment will always be allowed!

  #config.authorize do
  #  User.find(session[:user_id]).is_admin?
  #end
end
