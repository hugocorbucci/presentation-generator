class Slide < ActiveRecord::Base
  def initialize(searcher, *params)
    super(*params)
    
    unless content.nil?
      self.image= searcher.get_image(content)
    end
  end
end