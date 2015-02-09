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
    scope :popular, -> (count) { order(:view_count => :desc).limit(count) }
    scope :recent, -> (count) { order(:updated_at => :desc).limit(count) }
    scope :unviewed, -> (count) { where(view_count: [nil,0]).limit(count) }
    scope :search, ->(query) {
      where('title LIKE :q OR content LIKE :q OR description LIKE :q',
            q: "%#{query}%")
    }

    def should_generate_new_friendly_id?
        title_changed?
    end
  end
end
