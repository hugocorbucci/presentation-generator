class Presentation < ActiveRecord::Base
  has_many :slides
  
  def initialize(*params)
    super(*params)
    
    searcher = ImageSearcher.new
    unless content.nil?
      content.each_line do |line|
        slides << Slide.new(searcher, :content => line)
      end
    end
  end
end