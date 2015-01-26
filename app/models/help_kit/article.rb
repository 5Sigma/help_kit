module HelpKit
  class Article < ActiveRecord::Base
    belongs_to :category
    belongs_to :parent_article, class_name: 'Article'
    has_many :articles
    has_many :article_tags
    has_many :tags, :through => :article_tags
    validates :title, presence: true
    validates :content, presence: true
  end
end
