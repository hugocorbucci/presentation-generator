require File.join(File.expand_path(File.dirname(__FILE__)), '../spec_helper')

describe ImageSearcher do
  context 'class loading' do
    it 'should be able to get instance based on implementation param' do
      expect(ImageSearcher.engine('google').class).to be(GoogleImageSearcher)
    end

    it 'should be able to choose Flickr as image search engine' do
      expect(ImageSearcher.engine('flickr').class).to be(FlickrImageSearcher)
    end
  end
end
