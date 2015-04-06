require 'rails_helper'

RSpec.describe 'HelpKit Configuration' do
  describe "#config" do
    it "should yeild HelpKit module" do
      HelpKit.config  do |config|
        expect(config).to eq(HelpKit)
      end
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
