# Represents a single slide in a presentation
class Slide
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic

  field :image

  embedded_in :presentation, inverse_of: :slides

  def initialize(searcher, *params)
    super(*params)

    self.image = searcher.get_image(content) unless content.nil?
  end
end
