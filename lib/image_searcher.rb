require 'net/http'
require 'net/https'
require 'uri'
require 'json'

class ImageSearcher
  def get_image(words)
    escaped_words = CGI::escape(words)
    url = "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q=#{escaped_words}"
    # "http://api.flickr.com/services/rest?method=flickr.text.echo$name=#{escaped_words}"
    resource = Net::HTTP.get_response(URI.parse(url))
    puts resource.body.inspect
    response = JSON.parse(resource.body)
    data = response["responseData"]
    results = data["results"]
    result = results[0]
    result["url"]
  end
end