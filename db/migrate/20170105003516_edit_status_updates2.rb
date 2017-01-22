class EditStatusUpdates2 < ActiveRecord::Migration[5.0]
  def change
    remove_column :status_updates, :group_id
  end
end
