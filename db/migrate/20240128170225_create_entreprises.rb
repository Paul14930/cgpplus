class CreateEntreprises < ActiveRecord::Migration[7.0]
  def change
    create_table :entreprises do |t|
      t.string :nom
      t.string :forme_juridique
      t.string :activite
      t.decimal :capital_social
      t.decimal :valeur_estimee
      t.decimal :chiffre_affaires
      t.decimal :resultat_net
      t.integer :client_id
      t.integer :entreprise_mere_id
      t.date :date_creation
      t.date :date_acquisition

      t.timestamps
    end
  end
end
