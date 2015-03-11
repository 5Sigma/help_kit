module HelpKit

  def self.site_title=(val); @site_title=val;end
  def self.site_title; @site_title ||= '5Sigma Help'; end

  def self.header=(val); @header = val;end;
  def self.header
    @header ||= '<i class="fa fa-book"></i>Knowledge<strong>Base</strong>'
  end

  def self.authorization_method=(val);@authorization_method=val;end
  def self.authorization_method
    @authorization_method ||= lambda { True }
  end


  def self.authorize(&block)
    @authorization_method = block
  end

  def self.config(&block)
    yield(self)
  end

end
