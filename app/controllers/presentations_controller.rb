class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new
  end
  
  def create
    presentation = Presentation.new(params[:presentation])
    respond_to do |format|
      format.html {
        presentation.save        
        redirect_to presentation_path(presentation)
      }
      format.js {
        render :inline => presentation.slides.map{|slide| [slide.content, slide.image]}.to_json
      }
    end
  end
  
  def show
    @presentation = Presentation.find(params[:id])
  end
end
