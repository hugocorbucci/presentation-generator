class Presentation < ActiveRecord::Base
  has_many :slides
  
  def initialize(*params)
    super(*params)
    
    searcher = ImageSearcher.new
    lines = content ? content.split('\n') : []
    lines.each do |line|
      slides << Slide.new(searcher, :content => line)
    end
  end
end