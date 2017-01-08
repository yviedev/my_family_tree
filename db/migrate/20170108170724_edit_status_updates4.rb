class EditStatusUpdates4 < ActiveRecord::Migration[5.0]
  def change
    add_column :status_updates, :comment_id, :integer 
    add_column :status_updates, :vote_id, :integer 
  end
end
