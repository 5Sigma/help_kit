require 'rails_helper'

module HelpKit
  RSpec.describe Article, :type => :model do
    it { should validate_presence_of :content }
    it { should validate_presence_of :title }
    it { should belong_to :category }
    it { should belong_to :parent_article }
    it { should have_many :article_tags }
  end
end
