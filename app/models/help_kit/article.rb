module HelpKit
  class Article < ActiveRecord::Base
    include FriendlyId
    friendly_id :title, use: [:slugged]

    belongs_to :category
    belongs_to :parent_article, class_name: 'Article'
    has_many :articles
    has_many :article_tags
    has_many :tags, :through => :article_tags

    validates :title, presence: true
    validates :content, presence: true


    scope :for_category, -> (category) {
      where(category: category.self_and_descendants.pluck(:id))
    }

  end
end
