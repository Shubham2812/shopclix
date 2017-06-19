class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :store, index: true, foreign_key: true
      t.string :name
      t.integer :price
      t.string :category
      t.string :photo
      t.string :description
      t.string :color

      t.timestamps null: false
    end
  end
end
