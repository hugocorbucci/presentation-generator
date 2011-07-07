class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new(params[:presentation])
  end
  
  def create
    @presentation = Presentation.new(params[:presentation])
    respond_to do |format|
      format.html {
        if(params[:presentation][:preview])
          render :new
        else
          @presentation.save
          redirect_to presentation_path(@presentation)
        end
      }
      format.js {
        render :inline => @presentation.slides.map{|slide| [slide.content, slide.image]}.to_json
      }
    end
  end
  
  def show
    @presentation = Presentation.find(params[:id])
  end
end
