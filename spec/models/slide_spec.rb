require_relative('../spec_helper')
require_relative('../../lib/image_searcher')

describe Slide do
  it 'should be created with content' do
    searcher = double(ImageSearcher.new)
    expect(searcher).to receive(:get_image).with('silver bullet').and_return('http://dont-tread-on.me/wp-content/uploads/2011/02/silver-bullet9.jpg')
    slide = Slide.new(searcher, content: 'silver bullet')
    expect(slide.image).to eq('http://dont-tread-on.me/wp-content/uploads/2011/02/silver-bullet9.jpg')
  end
end
