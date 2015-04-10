class HelpKit::InstallGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)


  def copy_migrations
    rake "help_kit:install:migrations"
  end

  def copy_initializer
    initializer "help_kit.rb", <<-FILE
HelpKit.config do |config|
  # config.site_title is used to display the page titles.
  # config.site_title = "KnowledgeBase"

  # config.company_name is used for displaying a copyright notice on the page
  # footer

  config.company_name = "MyCompany"


  # config.header is used to display the branded text in the header bar on all
  # pages.
  # config.header = '<i class="fa fa-book"></i>Knowledge<strong>Base</strong>'

  # config.authorize should check if the current session is capable of editing
  # and managing the help system. If it does not return false or nil article
  # management will be alllowed.
  #  NOTE: If this value is not set managment will always be allowed!

  #config.authorize do
  #  User.find(session[:user_id]).is_admin?
  #end
end
    FILE
  end

  def setup_routes
    route %Q|mount HelpKit::Engine => "/kb"|
  end
end
