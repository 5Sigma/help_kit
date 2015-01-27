# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'shoulda-matchers'
require 'factory_girl_rails'
require 'awesome_nested_set'
require 'capybara'
require 'launchy'
require 'faker'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  Capybara.asset_host = 'http://localhost:3000'
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.mock_with :rspec
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"
  config.infer_spec_type_from_file_location!
  config.include Module.new {
    def self.included(base)
      base.routes { HelpKit::Engine.routes }
    end
  }, type: :controller
end
