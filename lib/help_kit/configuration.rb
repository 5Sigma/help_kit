module HelpKit

  mattr_writer :site_title
  def self.site_title; @site_title || 'KnowledgeBase'; end

  mattr_writer :header
  def self.header
    '<i class="fa fa-book"></i>Knowledge<strong>Base</strong>'
  end

  mattr_accessor :authorization_method


  def self.authorize(&block)
    self.authorization_method = block
  end

  def self.config(&block)
    yield(self)
  end

end
