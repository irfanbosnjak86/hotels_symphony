class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email, index: { unique: true }, null: false
      t.string :display_name
      t.integer :role

      t.timestamps
    end
  end
end
