class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :related_as_id
      t.integer :relative_id
      t.integer :user_id

      t.timestamps
    end
  end
end
