class ImmobiliersController < ApplicationController
  def new
    @client = Client.find(params[:client_id])
    @immobilier = @client.immobiliers.build
  end

  def create
    @proprietable = if params[:proprietable_type] == 'Entreprise'
                      Entreprise.find(params[:proprietable_id])
                    else
                      Client.find(params[:client_id])
                    end

    @immobilier = @proprietable.immobiliers.build(immobilier_params)

    if @immobilier.save
      # Redirige vers la page du client associé
      client = @proprietable.is_a?(Client) ? @proprietable : @proprietable.client
      redirect_to client_path(client), notice: 'Bien immobilier ajouté avec succès.'
    else
      render :new
    end
  end

  def destroy
    @immobilier = Immobilier.find(params[:id])
    client = @immobilier.proprietable_type == 'Client' ? @immobilier.proprietable : @immobilier.proprietable.client
    @immobilier.destroy
    redirect_to client_path(client), notice: 'Bien immobilier supprimé avec succès.'
  end

  def edit
    @client = Client.find(params[:client_id])
    @immobilier = Immobilier.find(params[:id])
  end

def update
  @immobilier = Immobilier.find(params[:id])

  if @immobilier.update(immobilier_params)
    # Redirige vers la page du client associé
    client = @immobilier.proprietable_type == 'Client' ? @immobilier.proprietable : @immobilier.proprietable.client
    redirect_to client_path(client), notice: 'Bien immobilier mis à jour avec succès.'
  else
    render :edit
  end
end



  private

  def immobilier_params
    params.require(:immobilier).permit(:designation, :date_acquisition, :valeur_acquisition, :taux_detention, :valeur_actuelle, :type_detention, :proprietable_type, :proprietable_id)
  end

end
