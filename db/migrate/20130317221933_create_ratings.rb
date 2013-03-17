class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.integer :score
      t.string :name

      t.timestamps
    end
    add_index :ratings, :user_id
  end
end
