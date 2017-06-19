class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.references :user, index: true, foreign_key: true
      t.string :name
      t.string :location
      t.string :contact
      t.string :photo
      t.string :description
      t.string :category

      t.timestamps null: false
    end
  end
end
