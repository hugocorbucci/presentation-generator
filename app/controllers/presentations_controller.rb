# Controller to create new presentations, index and show them
class PresentationsController < ApplicationController
  def new
    @presentation = Presentation.new(new_presentation_params)
  end

  def index
    @presentations = Presentation.all
  end

  def create
    @presentation = Presentation.new(create_presentation_params)
    respond_to do |format|
      format.html { render_page }
      format.js { render_json }
    end
  end

  def show
    @presentation = Presentation.find(params[:id])
  end

  private

  def new_presentation_params
    params.permit(:presentation)
  end

  def create_presentation_params
    params.require(:presentation).permit(:content, :preview)
  end

  def render_page
    if create_presentation_params[:preview]
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
