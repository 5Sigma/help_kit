require 'rails_helper'

module HelpKit
  RSpec.describe Category, :type => :model do
    it { should belong_to(:parent) }
    it { should have_many(:articles) }
  end
end
