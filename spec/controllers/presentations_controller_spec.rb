require File.join(File.expand_path(File.dirname(__FILE__)), '../spec_helper')
require File.join(File.expand_path(File.dirname(__FILE__)), '../../lib/image_searcher')

describe PresentationsController, :type => :controller do
  context "new action" do
    it "new action should have new presentation assigned" do
      get :new
      expect(assigns(:presentation)).not_to be_nil
    end

    it "new action should render new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  context "existing action" do
    before do
      @searcher = double(ImageSearcher)
      expect(@searcher).to receive(:get_image).and_return("http://www.image.com/image.png")
      expect(ImageSearcher).to receive(:engine).and_return(@searcher)
      
      @presentation = Presentation.new(:content => "silver bullet")
    end
    
    it "create action should redirect to show" do
      expect(Presentation).to receive(:new).with("content" => "silver bullet").and_return(@presentation)
      post :create, :presentation  => { :content => "silver bullet" }
      expect(response).to redirect_to(presentation_path(@presentation))
    end
  
    it "show action should have presentation with id assigned" do
      expect(Presentation).to receive(:find).with('1').and_return(@presentation)
      get :show, :id  => 1
      expect(assigns(:presentation)).not_to be_nil
      expect(assigns(:presentation)).not_to be_nil
    end
  
    it "show action should render show template" do
      expect(Presentation).to receive(:find).with('1').and_return(@presentation)
      get :show, :id => 1
      expect(response).to render_template(:show)
    end
  end
end
