class Ignite
  include Mongoid::Document
  include Mongoid::Timestamps
  
  embeds_many :slides
  
  field :content
  
  def initialize(*params)
    super(*params)
   
    searcher = ImageSearcher.engine("random")
    unless content.nil?
      content.each_line do |line|
        slides << Slide.new(searcher, :content => line)
      end
    end
  end
end
