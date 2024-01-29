class AddTauxDetentionToEntreprises < ActiveRecord::Migration[7.0]
  def change
    add_column :entreprises, :taux_detention, :float
  end
end
