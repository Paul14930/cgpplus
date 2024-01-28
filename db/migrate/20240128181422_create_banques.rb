class CreateBanques < ActiveRecord::Migration[7.0]
  def change
    create_table :banques do |t|
      t.string :nom
      t.string :siret

      t.timestamps
    end
  end
end
