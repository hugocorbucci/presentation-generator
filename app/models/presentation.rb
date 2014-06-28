class Presentation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  
  embeds_many :slides
  field :content
  
  def initialize(*params)
    super(*params)
   
    #TODO allow engine changing
    searcher = ImageSearcher.engine("google")
    unless content.nil?
      content.each_line do |line|
        slides << Slide.new(searcher, :content => line)
      end
    end
  end
end
