class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :nom
      t.string :prenom
      t.date :date_naissance
      t.string :situation_matrimoniale
      t.string :regime_matrimonial
      t.boolean :presence_enfants
      t.string :civilite, default: 'Monsieur'
      t.string :email
      t.string :telephone_principal
      t.string :telephone_secondaire
      t.text :adresse
      t.string :code_postal
      t.string :ville

      t.timestamps
    end
  end

end
