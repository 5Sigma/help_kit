module HelpKit
  class Category < ActiveRecord::Base
    include FriendlyId
    acts_as_nested_set
    friendly_id :name, :use => [:slugged]
    validates :name, presence: { message: 'Categories must have a name' }

    has_many :articles

    scope :top_level, ->{ where(parent: nil) }
    scope :no_articles, -> {
      includes(:articles).where(help_kit_articles: { category_id: nil })
    }

    def should_generate_new_friendly_id?
        name_changed?
    end
  end
end
