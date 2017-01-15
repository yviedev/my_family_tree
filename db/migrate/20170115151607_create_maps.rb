class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
