class AddVineyardToProduct < ActiveRecord::Migration
  def change
    add_column :products, :vineyard_id, :integer
  end
end
