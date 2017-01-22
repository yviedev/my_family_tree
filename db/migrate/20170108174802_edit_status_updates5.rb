class EditStatusUpdates5 < ActiveRecord::Migration[5.0]
  def change
    remove_column :status_updates, :comment_id
    remove_column :status_updates, :vote_id
  end
end
