class CreateImmobiliers < ActiveRecord::Migration[7.0]
  def change
    create_table :immobiliers do |t|
      t.string :designation
      t.date :date_acquisition
      t.decimal :valeur_acquisition
      t.float :taux_detention, default: 100
      t.decimal :valeur_actuelle
      t.string :type_detention, default: 'pleine propriété'
      t.references :proprietable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
