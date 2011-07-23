class IgnitesController < ApplicationController
  def new
    @ignite = Ignite.new(params[:ignite])
  end
  
  def index
    @ignites = Ignite.all
  end
  
  def create
    @ignite = Ignite.new(params[:ignite])
    respond_to do |format|
      format.html {
        @ignite.save
        redirect_to ignite_path(@ignite)
      }
    end
  end
  
  def show
    @ignite = Ignite.find(params[:id])
  end
end
