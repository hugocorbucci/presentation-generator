# Represents a full presentation to be given
class Presentation
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  embeds_many :slides
  field :content

  def initialize(*params)
    super(*params)

    # TODO: allow engine changing
    searcher = ImageSearcher.engine('google')
    add_slides_with(searcher) if content
  end

  private

  def add_slides_with(searcher)
    content.each_line do |line|
      slides << Slide.new(searcher, content: line)
    end
  end
end
