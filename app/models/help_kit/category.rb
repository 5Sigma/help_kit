module HelpKit
  class Category < ActiveRecord::Base
    include FriendlyId
    acts_as_nested_set
    friendly_id :name, :use => [:slugged]

    has_many :articles

    scope :top_level, ->{ where(parent: nil) }
  end
end
