require_relative('../spec_helper')
require_relative('../../lib/image_searcher')

describe PresentationsController, type: :controller do
  context 'existing action' do
    before do
      @searcher = double(ImageSearcher)
      expect(@searcher).to receive(:get_image).and_return('http://www.image.com/image.png')
      expect(ImageSearcher).to receive(:engine).and_return(@searcher)

      @presentation = Presentation.new(content: 'silver bullet')
    end

    it 'create action should redirect to show' do
      params = ActionController::Parameters.new('content' => 'silver bullet')
      params = params.permit('content')
      expect(Presentation).to(
        receive(:new).with(params).and_return(@presentation)
      )

      post :create, params: { presentation: { content: 'silver bullet' } }

      expect(response).to redirect_to(presentation_path(@presentation))
    end
  end
end
