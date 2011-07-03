class Presentation < ActiveRecord::Base
  has_many :slides
  
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
