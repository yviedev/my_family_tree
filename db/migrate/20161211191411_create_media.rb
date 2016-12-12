class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
      t.integer :image_id
      t.integer :video_id
      t.integer :user_id

      t.timestamps
    end
  end
end
