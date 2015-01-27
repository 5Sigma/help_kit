require 'rails_helper'

module HelpKit
  RSpec.describe Category, :type => :model do
    it { should belong_to(:parent) }
    it { should have_many(:articles) }

    describe "#top level" do
      let(:parent) { create(:category) }
      let(:child) { create(:category, parent: category) }
      let(:sibling) { create(:category) }
      it "should return category without parent" do
        expect(Category.top_level).to eq([parent,sibling])
      end
    end
  end
end
