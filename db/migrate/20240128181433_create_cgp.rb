class CreateCgp < ActiveRecord::Migration[7.0]
  def change
    create_table :cgps do |t|
      t.string :nom
      t.string :prenom
      t.string :email
      t.string :telephone
      t.integer :banque_id

      t.timestamps
    end
  end
end
