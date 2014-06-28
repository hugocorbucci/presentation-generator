require File.join(File.expand_path(File.dirname(__FILE__)), '../spec_helper')

describe Presentation do  
  context "new" do
    before :each do
      @presentation = Presentation.new
    end
    
    it "should have empty content" do
      expect(@presentation.content).to be_blank
    end
    
    it "should have 0 slides" do
      expect(@presentation.slides).to be_empty
    end
  end
  
  context "with one line content" do
    before :each do
      engine = double(ImageSearcher)
      expect(engine).to receive(:get_image).and_return("http://www.image.com/image.png")
      expect(ImageSearcher).to receive(:engine).and_return(engine)
      @presentation = Presentation.new(:content => "silver bullet")
    end
    
    it "should have one line content" do
      expect(@presentation.content).to eq("silver bullet")
    end
    
    it "should have one slide" do
      expect(@presentation.slides).to have_exactly(1).items
    end
  end
end
