require 'net/http'
require 'net/https'
require 'uri'
require 'json'

class ImageSearcher
  def self.engine(engine)
    engine == "google" ? GoogleImageSearcher.new : FlickrImageSearcher.new
  end
  
  def get_image(words)
    escaped_words = CGI::escape(words)
    data = json_from(url(escaped_words))
    parse(data)
  end

  protected
    def json_from(url)
      resource = Net::HTTP.get_response(URI.parse(url))
      JSON.parse(resource.body)
    end
end

class FlickrImageSearcher < ImageSearcher
  def url(escaped_words)
    #TODO use api_key on config/flickr.yml
    "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=5170099ef3339caa3f610c7be46723c4&page=1&per_page=1&tags=#{escaped_words}&format=json&nojsoncallback=1"
  end
  
  def parse(data)
    photos = data["photos"]
    if photos.empty?
      ""
    else
      photo = photos["photo"][0]
      "http://farm#{photo['farm']}.static.flickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_z.jpg"
    end
  end
end

class GoogleImageSearcher < ImageSearcher
  def url(escaped_words)
    "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{escaped_words}"
  end
  def parse(data)
    results = data["responseData"]["results"]
    if results.empty?
      ""
    else
      result = results[0]
      result["url"]
    end
  end
end
