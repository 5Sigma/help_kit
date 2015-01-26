$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "help_kit/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "help_kit"
  s.version     = HelpKit::VERSION
  s.authors     = ["Joe Bellus"]
  s.email       = ["joe@5sigma.io"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of HelpKit."
  s.description = "TODO: Description of HelpKit."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]


  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "bourbon"
  s.add_dependency "slim-rails"
  s.add_dependency "neat"
  s.add_dependency "font-awesome-sass"
  s.add_dependency "awesome_nested_set"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "launchy"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "cucumber-rails"
  s.add_development_dependency "database_cleaner"

end
