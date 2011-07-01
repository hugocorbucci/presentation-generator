require 'spec_helper'

describe Presentation do  
  context "new" do
    before :each do
      @presentation = Presentation.new
    end
    
    it "should have empty content" do
      @presentation.content.should be_blank
    end
    
    it "should have 0 slides" do
      @presentation.slides.should be_empty
    end
  end
  
  context "with one line content" do
    before :each do
      @presentation = Presentation.new(:content => "silver bullet")
    end
    
    it "should have one line content" do
      @presentation.content.should == "silver bullet"
    end
    
    it "should have one slide" do
      @presentation.slides.size.should == 1
    end
  end
end