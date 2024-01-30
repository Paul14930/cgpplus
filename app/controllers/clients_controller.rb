class ClientsController < ApplicationController

  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
    @cgp = @client.cgp
    @entreprises = @client.entreprises.includes(:immobiliers)

    # Nouvelle variable pour l'organigramme
    @organigramme_data = prepare_organigramme_data(@client.entreprises)
    @immobiliers = @client.immobiliers + Immobilier.where(proprietable: @client.entreprises)
  end

  def new
    @cgp = Cgp.find(params[:cgp_id])
    @client = @cgp.clients.build
  end


  def edit
    @client = Client.find(params[:id])
  end

  def create
    @cgp = Cgp.find(params[:cgp_id])
    @client = @cgp.clients.build(client_params)
    if @client.save
      redirect_to cgp_client_path(@cgp, @client)
    else
      render :new
    end
  end


  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to @client
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to clients_url
  end

  private

  def prepare_organigramme_data(entreprises)
    entreprises.map do |entreprise|
      {
        id: entreprise.id,
        nom: entreprise.nom,
        entreprise_mere_id: entreprise.entreprise_mere_id,
        taux_detention: entreprise.taux_detention,
        filiales: prepare_organigramme_data(entreprise.filiales)
      }
    end
  end
    def client_params
      params.require(:client).permit(:cgp_id, :nom, :prenom, :date_naissance, :situation_matrimoniale, :regime_matrimonial, :presence_enfants, :civilite, :email, :telephone_principal, :telephone_secondaire, :adresse, :code_postal, :ville)
    end
end
