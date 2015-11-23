require 'net/http'
require 'net/https'
require 'uri'
require 'json'

# A top level generic searcher class
class ImageSearcher
  def self.engine(engine)
    case engine
    when 'google'
      GoogleImageSearcher.new
    when 'flickr'
      FlickrImageSearcher.new
    else
      Randomizer.new(GoogleImageSearcher.new)
    end
  end

  def get_image(words, index = 0)
    escaped_words = CGI.escape(words)
    data = json_from(url(escaped_words))
    parse(data, index)
  end

  protected

  def json_from(url)
    resource = Net::HTTP.get_response(URI.parse(url))
    JSON.parse(resource.body)
  end
end

# A searcher whose results are randomized
class Randomizer < ImageSearcher
  def initialize(searcher)
    @searcher = searcher
  end

  def get_image(words)
    index = rand(100)
    @searcher.get_image(words, index)
  end
end

# An image searcher that searches on Flickr
class FlickrImageSearcher < ImageSearcher
  def url(escaped_words)
    # TODO: use api_key on config/flickr.yml
    "http://api.flickr.com/services/rest/?method=flickr.photos.search&\
api_key=5170099ef3339caa3f610c7be46723c4&page=1&per_page=1&\
tags=#{escaped_words}&format=json&nojsoncallback=1"
  end

  def parse(data, index)
    photos = data['photos']
    if photos.blank?
      ''
    else
      list = photos['photo']
      photo = list[index % list.size]
      "http://farm#{photo['farm']}.static.flickr.com/#{photo['server']}/\
#{photo['id']}_#{photo['secret']}_z.jpg"
    end
  end
end

# An image searcher that searches on Google images
class GoogleImageSearcher < ImageSearcher
  def url(escaped_words)
    "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&\
q=#{escaped_words}"
  end

  def parse(data, index)
    results = data['responseData']['results']
    if results.empty?
      ''
    else
      puts "Choosing result indexed at #{index % results.size}"
      result = results[index % results.size]
      result['url']
    end
  end
end
