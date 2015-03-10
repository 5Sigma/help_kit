module HelpKit

  mattr_writer :site_title
  def self.site_title; @site_title || 'KnowledgeBase'; end
  mattr_accessor :authorization_method


  def self.is_authorized?
    authorization_method.call
  end

  def self.authorize(&block)
    self.authorization_method = block
  end

  def self.config(&block)
    yield(self)
  end

end
