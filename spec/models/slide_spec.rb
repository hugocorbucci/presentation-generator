require 'spec_helper'
require 'lib/image_searcher'

describe Slide do
  it "should be created with content" do
    searcher = mock(ImageSearcher.new)
    searcher.should_receive(:get_image).with('silver bullet').and_return('http://dont-tread-on.me/wp-content/uploads/2011/02/silver-bullet9.jpg')
    slide = Slide.new(searcher, :content => 'silver bullet')
    slide.image.should == 'http://dont-tread-on.me/wp-content/uploads/2011/02/silver-bullet9.jpg'
  end
end