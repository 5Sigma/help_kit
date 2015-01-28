require_dependency "help_kit/application_controller"

module HelpKit
  class Admin::CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end
  end
end
