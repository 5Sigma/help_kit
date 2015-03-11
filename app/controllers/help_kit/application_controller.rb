module HelpKit
  class ApplicationController < ActionController::Base


    private

    def is_authorized?
      self.instance_exec(&HelpKit.authorization_method)
    end
    helper_method :is_authorized?
  end
end
