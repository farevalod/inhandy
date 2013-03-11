class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.boolean :sponsored
      t.integer :score
      t.references :user
      t.references :product

      t.timestamps
    end
    add_index :posts, :user_id
    add_index :posts, :product_id
  end
end
