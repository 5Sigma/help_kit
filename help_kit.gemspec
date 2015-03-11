$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "help_kit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "help_kit"
  s.version     = HelpKit::VERSION
  s.authors     = ["Joe Bellus"]
  s.email       = ["joe@5sigma.io"]
  s.homepage    = "http://helpkit.5sigma.io"
  s.summary     = "Knowledgebase engine for Rails"
  s.description = "An isolated knowledgebase system for Rails that is easily application mountable"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]


  s.add_dependency "rails", "~> 4"
  s.add_dependency "bourbon"
  s.add_dependency "slim-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "neat"
  s.add_dependency "font-awesome-sass"
  s.add_dependency "awesome_nested_set"
  s.add_dependency "friendly_id", '~> 5.1.0'
  s.add_dependency "simple_form"
  s.add_dependency "select2-rails"
  s.add_dependency "coffee-rails"
  s.add_dependency "jquery-rails"
  s.add_dependency "redcarpet"
  s.add_dependency "pygmentize"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "poltergeist"
  s.add_development_dependency "launchy"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "faker"

end
