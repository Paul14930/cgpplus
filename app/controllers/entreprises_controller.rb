
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

  def cession
  @entreprise = Entreprise.find(params[:id])
  @entreprise_mere = @entreprise.entreprise_mere

  # Calcul de la valeur d'acquisition détenue
  @valeur_acquisition_detenue = @entreprise.capital_social * (@entreprise.taux_detention / 100)

  # Calcul de la valeur de cession proportionnelle
  @valeur_cession_proportionnelle = @entreprise.valeur_estimee * (@entreprise.taux_detention / 100)

  # Calcul de la plus-value taxable
  @plus_value_taxable = @valeur_cession_proportionnelle - @valeur_acquisition_detenue

  # Calcul de la fiscalité
  case @entreprise.forme_juridique
  when /sas/i
    @taux_fiscalite = 0.01
  when /sarl/i
    @taux_fiscalite = 0.05
  else
    @taux_fiscalite = 0 # ou un autre taux par défaut
  end

  # Montant de la taxe
  @montant_taxe = @plus_value_taxable * @taux_fiscalite

  @remontee_dans_holding = (@plus_value_taxable - @montant_taxe) * 0.01

  @montant_distribuable_holding = @plus_value_taxable - @montant_taxe - @remontee_dans_holding

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

