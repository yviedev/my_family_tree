class EditLikes1 < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :status_update_id, :integer
  end
end
