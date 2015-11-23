# Controller to create new presentations, index and show them
class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new(params[:presentation])
  end

  def index
    @presentations = Presentation.all
  end

  def create
    @presentation = Presentation.new(params[:presentation])
    respond_to do |format|
      format.html { render_page }
      format.js { render_json }
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  private

  def render_page
    if params[:presentation][:preview]
      render :new
    else
      @presentation.save
      redirect_to presentation_path(@presentation)
    end
  end

  def render_json
    slides = @presentation.slides.map do |slide|
      [slide.content, slide.image]
    end
    render inline: slides.to_json
  end
end
