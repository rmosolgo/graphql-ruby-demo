class CreateDroids < ActiveRecord::Migration
  def change
    create_table :droids do |t|
      t.string :name
      t.text :appears_in
      t.string :primary_function

      t.timestamps null: false
    end
  end
end
