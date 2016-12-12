class CreateStatusUpdates < ActiveRecord::Migration[5.0]
  def change
    create_table :status_updates do |t|
      t.text :post
      t.integer :user_id

      t.timestamps
    end
  end
end
