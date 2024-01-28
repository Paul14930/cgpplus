class EntreprisesController < ApplicationController

  def index
    @entreprises = Entreprise.all
  end

  def show
    @entreprise = Entreprise.find(params[:id])
  end

  def new
    @entreprise = Entreprise.new
  end

  def edit
    @entreprise = Entreprise.find(params[:id])
  end

  def create
    @entreprise = Entreprise.new(entreprise_params)
    if @entreprise.save
      redirect_to @entreprise
    else
      render :new
    end
  end

  def update
    @entreprise = Entreprise.find(params[:id])
    if @entreprise.update(entreprise_params)
      redirect_to @entreprise
    else
      render :edit
    end
  end

  def destroy
    @entreprise = Entreprise.find(params[:id])
    @entreprise.destroy
    redirect_to entreprises_url
  end

  private
    def entreprise_params
      params.require(:entreprise).permit(:nom, :forme_juridique, :activite, :capital_social, :valeur_estimee, :chiffre_affaires, :resultat_net, :client_id, :entreprise_mere_id, :date_creation, :date_acquisition)
    end
end
