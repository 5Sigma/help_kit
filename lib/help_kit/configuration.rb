module HelpKit

  def self.site_title=(val); @site_title=val;end
  def self.site_title; @site_title ||= 'KnowledgeBase'; end

  def self.company_name=(val); @company_name=val;end
  def self.company_name; @company_name ||= 'MyCompany'; end

  def self.show_powered=(val); @show_powered=val;end
  def self.show_powered; @show_powered ||= true; end

  def self.header=(val); @header = val;end;
  def self.header
    @header ||= '<i class="fa fa-book"></i>Knowledge<strong>Base</strong>'
  end

  def self.authorization_method=(val);@authorization_method=val;end
  def self.authorization_method
    @authorization_method ||= lambda { true }
  end


  def self.authorize(&block)
    @authorization_method = block
  end

  def self.config(&block)
    yield(self)
  end

end
