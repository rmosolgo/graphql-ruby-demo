class CreateHumen < ActiveRecord::Migration
  def change
    create_table :humen do |t|
      t.string :name
      t.text :appears_in
      t.string :home_planet

      t.timestamps null: false
    end
  end
end
