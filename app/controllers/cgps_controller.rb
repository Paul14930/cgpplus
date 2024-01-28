class CgpsController < ApplicationController
  def show
    @cgp = Cgp.find(params[:id])
  end
  
  def index
    @cgps = Cgp.all
  end

end
