class AddReferencesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :cgp_id, :integer
    add_column :users, :banque_id, :integer
  end
end
