require 'rails_helper'
module HelpKit
  RSpec.describe ApplicationController do
    describe "#is_authorized" do
      it "should have access to session" do
        allow(HelpKit).to receive(:authorization_method)
          .and_return(Proc.new { session[:test] })
        expect(controller.send(:is_authorized?)).to eq(nil)
      end
    end
  end
end
