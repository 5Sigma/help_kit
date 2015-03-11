require 'rails_helper'

RSpec.describe 'HelpKit Configuration' do
  describe "#config" do
    it "should yeild HelpKit module" do
      HelpKit.config  do |config|
        expect(config).to eq(HelpKit)
      end
    end
  end
  describe "#admin_checker" do
    it "should set @admin_checker_method" do
      HelpKit.config do |config|
        config.authorize do
          true
        end
      end
      expect(HelpKit.authorization_method).to be_a Proc
    end
  end
  describe "#is_admin_user" do
    it "should return result of admin_checker_method" do
      HelpKit.config do |config|
        config.authorize do
          23
        end
      end
      expect(HelpKit.is_authorized?).to eq(23)
    end
  end
  describe "#site_title" do
    it "should respond to #site_title" do
      expect(HelpKit.respond_to?(:site_title))
    end
    it "should respond to #site_title=" do
      expect(HelpKit.respond_to?(:site_title=))
    end
  end
end
