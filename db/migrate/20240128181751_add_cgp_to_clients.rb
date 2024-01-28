class AddCgpToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :cgp_id, :integer
  end
end
