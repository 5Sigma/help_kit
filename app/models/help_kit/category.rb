module HelpKit
  class Category < ActiveRecord::Base
    belongs_to :parent
    has_many :articles
    acts_as_nested_set
  end
end
