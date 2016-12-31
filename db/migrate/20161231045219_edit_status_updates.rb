class EditStatusUpdates < ActiveRecord::Migration[5.0]
  def change
    add_column :status_updates, :url, :string
    add_column :status_updates, :group_id, :integer
  end
end
