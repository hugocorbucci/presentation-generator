require 'spec_helper'

describe ImageSearcher do

  context "class loading" do
    it "should be able to get instance based on implementation param" do
      ImageSearcher.engine("google").class.should be(GoogleImageSearcher)
    end

    it "should be able to choose Flickr as image search engine" do
      ImageSearcher.engine("flickr").class.should be(FlickrImageSearcher)
    end
  end
end
