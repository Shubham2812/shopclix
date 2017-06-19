class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :photo
      t.string :city
      t.string :address
      t.string :pin

      t.timestamps null: false
    end
  end
end
