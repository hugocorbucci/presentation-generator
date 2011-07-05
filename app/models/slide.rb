class Slide
  include Mongoid::Document
  include Mongoid::Timestamps

  field :image
  
  embedded_in :presentation, :inverse_of => :slides
  
  def initialize(searcher, *params)
    super(*params)
    
    unless content.nil?
      self.image= searcher.get_image(content)
    end
  end
end
