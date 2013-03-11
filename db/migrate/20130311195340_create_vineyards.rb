class CreateVineyards < ActiveRecord::Migration
  def change
    create_table :vineyards do |t|
      t.string :name

      t.timestamps
    end
  end
end
