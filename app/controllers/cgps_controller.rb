class CgpsController < ApplicationController
  def show
    @cgp = Cgp.find(params[:id])
    @clients = @cgp.clients
  end

  def index
    @cgps = Cgp.all
  end

end
