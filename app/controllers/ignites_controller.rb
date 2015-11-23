# Controller for creating and listing and showing Ignites
class IgnitesController < ApplicationController
  def new
    @ignite = Ignite.new(params[:ignite])
  end

  def index
    @ignites = Ignite.all
  end

  def create
    @ignite = Ignite.new(allowed_ignite_params)
    respond_to do |format|
      format.html do
        @ignite.save
        redirect_to ignite_path(@ignite)
      end
    end
  end

  def show
    @ignite = Ignite.find(params[:id])
  end

  private

  def allowed_ignite_params
    params.require(:ignite).permit(:content)
  end
end
