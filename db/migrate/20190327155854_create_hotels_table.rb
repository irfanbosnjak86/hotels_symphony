class CreateHotelsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.text :address
      t.text :description
      t.string :geolocation
      t.string :overall_rating

      t.timestamps
    end
  end
end
