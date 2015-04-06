require_dependency "help_kit/application_controller"

module HelpKit
  class LandingController < ApplicationController
    layout 'help_kit/minimal'

    def land
       @popular = Article.published.popular(5)
       @recent = Article.published.recent(5)
    end

  end
end
