require 'net/http'
require 'net/https'
require 'uri'
require 'json'

class ImageSearcher

  def self.engine(engine)
    engine = GoogleImageSearcher.new  if engine == "google" 

    engine = FlickrImageSearcher.new if engine == "flickr"
 
    engine
  end

  protected
    def json_from(url)
      resource = Net::HTTP.get_response(URI.parse(url))
      JSON.parse(resource.body)
    end

end

class FlickrImageSearcher < ImageSearcher

  def get_image(words)
    escaped_words = CGI::escape(words)
    #TODO use api_key on config/flickr.yml
   url = "http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=5170099ef3339caa3f610c7be46723c4&page=1&per_page=1&tags=#{escaped_words}&format=json&nojsoncallback=1"
   #http://www.flickr.com/services/api/flickr.photos.search.html
    data = json_from(url)["photos"]
    photo = data["photo"][0]
    "http://farm#{photo['farm']}.static.flickr.com/#{photo['server']}/#{photo['id']}_#{photo['secret']}_z.jpg"

  end
end

class GoogleImageSearcher < ImageSearcher

   def get_image(words)
      escaped_words = CGI::escape(words)
      url = "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{escaped_words}"
      # "http://api.flickr.com/services/rest?method=flickr.text.echo$name=#{escaped_words}"
      data = json_from(url)["responseData"]
      results = data["results"]
      result = results[0]
      result["url"]
   end
end
