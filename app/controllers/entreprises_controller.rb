class EntreprisesController < ApplicationController

  def index
    @entreprises = Entreprise.all
  end

  def show
    @entreprise = Entreprise.find(params[:id])
  end

  def new
    @client = Client.find(params[:client_id])
    @entreprise = @client.entreprises.build
    @entreprise.entreprise_mere_id = params[:entreprise_mere_id] if params[:entreprise_mere_id]
  end



  def edit
    @entreprise = Entreprise.find(params[:id])
    @client = @entreprise.client
    @cgp = @client.cgp
  end


  def create
    @client = Client.find(params[:client_id])
    @entreprise = @client.entreprises.build(entreprise_params)

    if @entreprise.save
      redirect_to cgp_client_path(@client.cgp, @client), notice: 'Entreprise créée avec succès.'
    else
      render :new
    end
  end


  def update
    @entreprise = Entreprise.find(params[:id])
    if @entreprise.update(entreprise_params)
      # Rediriger vers la page show du client associé
      redirect_to cgp_client_path(@entreprise.client.cgp, @entreprise.client), notice: 'Entreprise mise à jour avec succès.'
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
      params.require(:entreprise).permit(:taux_detention, :nom, :forme_juridique, :activite, :capital_social, :valeur_estimee, :chiffre_affaires, :resultat_net, :client_id, :entreprise_mere_id, :date_creation, :date_acquisition)
    end
end
