class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :variety
      t.string :area
      t.integer :year
      t.string :fingerptint

      t.timestamps
    end
  end
end
