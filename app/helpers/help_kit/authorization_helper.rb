module HelpKit
  module AuthorizationHelper
    def is_authorized?
      self.instance_exec(&HelpKit.authorization_method)
    end
  end
end
