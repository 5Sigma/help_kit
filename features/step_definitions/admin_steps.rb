Given "a logged in admin user" do
  HelpKit.authorization_method = Proc.new { true }
end
