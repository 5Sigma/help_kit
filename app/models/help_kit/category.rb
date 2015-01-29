module HelpKit
  class Category < ActiveRecord::Base
    include FriendlyId
    acts_as_nested_set
    friendly_id :name, :use => [:slugged]
    validates :name, presence: { message: 'Categories must have a name' }

    has_many :articles

    scope :top_level, ->{ where(parent: nil) }
  end
end
