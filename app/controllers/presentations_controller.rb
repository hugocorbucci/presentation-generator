class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new
  end
  
  def create
    presentation = Presentation.new(params[:presentation])
    presentation.save
    redirect_to presentation_path(presentation)
  end
  
  def show
    @presentation = Presentation.find(params[:id])
  end
end
